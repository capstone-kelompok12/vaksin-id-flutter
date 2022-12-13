import 'package:dio/dio.dart';
import 'package:vaksin_id_flutter/models/health_facilities_byname_model.dart';
import 'package:vaksin_id_flutter/models/health_facilities_model.dart';

class DetailFasKesService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app';
  final dio = Dio();
  late Response response;

  Future getHealthFacilities() async {
    late List healthFacilitiesList;
    try {
      final response = await dio.get("$baseURL/api/v1/healthfacilities");

      healthFacilitiesList = response.data['data'];

      print('response: ${response.data['data']}');

      // return result;
    } catch (e) {
      throw 'Error: $e';
    }
    return healthFacilitiesList
        .map((e) => HealthFacilitiesModel.fromJson(e))
        .toList();
  }

  Future<HealthFacilitiesByNameModel> getDetailHealthFacilities(
      String? nama) async {
    print('nama: $nama');

    try {
      response = await dio.get("$baseURL/api/v1/healthfacilities/$nama");

      print('response: ${response.data['data']}');
    } on DioError catch (e) {
      rethrow;
    }

    return HealthFacilitiesByNameModel.fromJson(response.data['data']);
  }
}
