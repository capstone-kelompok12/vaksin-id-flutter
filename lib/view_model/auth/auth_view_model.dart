import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/auth/login_model.dart';
import 'package:vaksin_id_flutter/models/auth/register_model.dart';
import 'package:vaksin_id_flutter/services/auth/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final authService = AuthService();

  Future<String> postLogin(LoginModel login) async {
    String token = await authService.postLogin(login);
    notifyListeners();
    return token;
  }

  Future<void> postRegister(RegisterModel register) async {
    await authService.postRegister(register);
    notifyListeners();
  }
}