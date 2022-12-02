import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/auth/login_model.dart';
import 'package:vaksin_id_flutter/models/auth/register_model.dart';

class AuthService {
  final String baseUrl = 'https://vaksin-y3awbiupna-as.a.run.app/api/v1';

  Future<dynamic> postRegister({RegisterModel? register}) async {
    try {
      final response = await Dio().post(
        "$baseUrl/signup",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: register!.toJson(),
      );
      print('Register = ${response.data}');
    } catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode == 500) {
          throw 'NIK atau Email Sudah Digunakan';
        } else {
          throw 'Ada masalah dengan koneksi ke server';
        }
      }
    }
  }

  Future<String> postLogin({LoginModel? login}) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    try {
      final response = await Dio().post(
        "$baseUrl/login",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: login!.toJson(),
      );
      if (response.statusCode == 200) {
        await prefs.setString("Token", response.data['data']["Token"]);
        token = response.data['data']['Token'];
        //print(token);
      }
      print('Login = ${response.data}');
    } catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode == 401) {
          throw 'Email Atau Password Salah';
        }
      } else {
        throw 'Ada masalah dengan koneksi ke server';
      }
    }
    return token!;
  }
}
