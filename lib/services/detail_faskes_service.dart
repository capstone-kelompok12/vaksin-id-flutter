import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';

class DetailFasKesService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app/';

  final dio = Dio();

  HealthFaciApi() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  // getVaccines() async {
  //   SharedPreferences? prefs = await SharedPreferences.getInstance();
  //   // String token = prefs.getString('token').toString();
  //   try {
  //     final response = await Dio().get(
  //       "$baseURL/api/v1/vaccines",
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           // 'Authorization': 'Bearer $token',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       final bookingList = (response.data['data'] as List)
  //           .map((e) => VaccineModel.fromJson(e))
  //           .toList();
  //       return bookingList;
  //     }
  //   } catch (_) {}
  // }

  Future<VaccineModel> getVaccines() async {
    late VaccineModel result;
    try {
      final response = await Dio().get(baseURL);

      print('response: ${response.data['data']}');

      result = VaccineModel.fromJson(response.data);

      // return result;
    } catch (e) {
      throw 'Error: $e';
    }
    return result;
  }
}
