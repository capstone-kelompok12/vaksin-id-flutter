import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/health_facilities_byname_model.dart';

class DetailFasKesService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app';

  final dio = Dio();

  Future getDetailHealthFacilities(String? nama) async {
    print('nama: $nama');
    late Response response;
    try {
      response = await dio.get("$baseURL/api/v1/healthfacilities/$nama");

      print('response: ${response.data['data']}');

      // return result;
    } catch (e) {
      throw 'Error: $e';
    }

    return HealthFacilitiesByNameModel.fromJson(response.data['data']);
  }
}
