import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/health_facilities_byname_model.dart';
import 'package:vaksin_id_flutter/models/health_facilities_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';

class DetailFasKesService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app';

  final dio = Dio();

  Future getDetailHealthFacilities(String? nama) async {
    print('nama: $nama');
    late List detailFaskes;
    try {
      final response = await dio.get("$baseURL/api/v1/healthfacilities/$nama");

      detailFaskes = response.data['data']
          .map((e) => HealthFacilitiesByNameModel.fromJson(e))
          .toList();

      print('response: $detailFaskes');

      // return result;
    } catch (e) {
      throw 'Error: $e';
    }
  }
}
