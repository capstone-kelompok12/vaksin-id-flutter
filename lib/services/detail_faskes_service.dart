import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/booking/health_facilities_byname_model.dart';
import 'package:vaksin_id_flutter/models/booking/user_model.dart';

class DetailFasKesService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app';
  final dio = Dio();

  Future<HealthFacilitiesByNameModel> getDetailHealthFacilities(
      String? nama) async {
    print('nama: $nama');
    late Response response;
    try {
      response = await dio.get("$baseURL/api/v1/healthfacilities/$nama");

      print('response: ${response.data['data']}');
    } on DioError catch (e) {
      rethrow;
    }

    return HealthFacilitiesByNameModel.fromJson(response.data['data']);
  }

  Future<UserModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token').toString();
    try {
      final response = await Dio().get(
        '$baseURL/profile',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(token);
      final data = response.data;
      print(data);
      return UserModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }
}
