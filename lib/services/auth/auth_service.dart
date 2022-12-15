import 'package:dio/dio.dart';
import 'package:vaksin_id_flutter/models/auth/login_model.dart';
import 'package:vaksin_id_flutter/models/auth/register_model.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';

class AuthService {
  final String baseUrl = 'https://vaksin-y3awbiupna-as.a.run.app/api/v1';
  Future<void> postRegister(RegisterModel register) async {
    try {
      final response = await Dio().post(
        "$baseUrl/signup",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: register.toJson(),
      );
      return response.data['data'];
    } on DioError catch (e) {
      print(e.response!.data['message']);
      if (e.response!.statusCode == 500) {
        throw 'NIK atau Password Sudah Digunakan';
      } else {
        throw 'Ada masalah dengan koneksi ke server';
      }
    }
  }

  Future<String> postLogin(LoginModel login) async {
    SharedService prefs = SharedService();
    String? token;

    try {
      final response = await Dio().post(
        "$baseUrl/login",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: login.toJson(),
      );
      print(response.data['message']);
      print(response.data['error']);
      print(response.statusCode);
      if (response.statusCode == 200) {
        await prefs.saveToken('Token');
        token = response.data['data']['Token'];
      }
      print(token);
      //return response.data['Token'];
    } on DioError catch (e) {
      print(e.response!.data['message']);
      print(e.response!.data['error']);
      print(e.response!.statusCode);
      if (e.response!.statusCode == 500) {
        throw 'Email atau Password Salah';
      } else {
        throw 'Ada masalah dengan koneksi ke server';
      }
    }
    return token!;
  }
}
