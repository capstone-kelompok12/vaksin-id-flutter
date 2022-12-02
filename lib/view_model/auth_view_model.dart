import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/auth/login_model.dart';
import 'package:vaksin_id_flutter/models/auth/register_model.dart';
import 'package:vaksin_id_flutter/services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final key = "AUTH_TOKEN";
  SharedPreferences? _prefs;
  final authService = AuthService();


  Future<String?> getToken() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!.getString(key);
  }

  Future<void> setToken(String token) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.setString(token, key);

  }

  Future<void> deleteToken() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.remove(key);

  }

  Future<String> postLogin(LoginModel? login) async {
    String token = await authService.postLogin(login: login);
    return token;
  }

  Future<void> postRegister(RegisterModel? register) async {
    await authService.postRegister(register: register);
  }
}