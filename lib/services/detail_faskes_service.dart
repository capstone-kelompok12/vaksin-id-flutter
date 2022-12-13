import 'package:dio/dio.dart';
import 'package:vaksin_id_flutter/models/health_facilities_byname_model.dart';

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
}
