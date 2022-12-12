import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/health_facilities_byname_model.dart';
import 'package:vaksin_id_flutter/models/health_facilities_model.dart';

class DetailFasKesService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app';

  final dio = Dio();

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

  Future getDetailHealthFacilities(String? nama) async {
    print('nama: $nama');
    // late List detailFaskes;
    late Response response;
    try {
      response = await dio.get("$baseURL/api/v1/healthfacilities/$nama");

      // detailFaskes = response.data['data'];

      print('response: ${response.data['data']}');

      // detailFaskes = response.data['data']
      //     .map((e) => HealthFacilitiesByNameModel.fromJson(e))
      //     .toList();

      // print('response: $detailFaskes');

      // return result;
    } catch (e) {
      throw 'Error: $e';
    }

    return HealthFacilitiesByNameModel.fromJson(response.data['data']);
  }
}
