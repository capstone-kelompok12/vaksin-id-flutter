import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/nearby_healt_facilities_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';
// import '../models/home_model.dart';

class HealthFaciApi {
  // String baseUrl = 'https://kipi.covid19.go.id/api/get-faskes-vaksinasi?skip=0&province=JAWA+TENGAH&city=KLATEN';
  final dio = Dio(BaseOptions(
    baseUrl: "https://vaksin-y3awbiupna-as.a.run.app/api/v1",
  ));

  HealthFaciApi() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // final prefs = await SharedPreferences.getInstance();
        // final String token = prefs.getString('token') ?? "";
        const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJOaWtVc2VyIjoiMzE3NTA4MTExMTAwMDA3MCIsIkVtYWlsIjoiYW5jYXNAZ21haWwuY29tIiwiZXhwIjoxNjcwNjA0NTk0fQ.a9kTU1nSc5W4NyQg7l-F1mVCaJEdQDmplVhgreLt9rM';
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<NearbyHealthFacilitiesModel> getNearbyHealthFacilities() async {
    try {
      final response = await dio.get('/profile/nearby');

      final result = NearbyHealthFacilitiesModel.fromJson(response.data);
      print('response: ${result}');
      return result;
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        print(error.response.toString());
        throw Error();
      }
      print(error);
      throw Error();
    }
  }

  Future<VaccineModel> getVaccine() async {
    try {
      final response = await dio.get('/vaccines');

      final result = VaccineModel.fromJson(response.data);

      return result;
    } catch (e) {
      throw 'Error: $e';   
    }
  }

  // Future<HealthFacilities> getListHealthFaci() async {
  //   late HealthFacilities result;
  //   try {
  //     final response = await Dio().get(
  //         'https://kipi.covid19.go.id/api/get-faskes-vaksinasi',
  //         queryParameters: {
  //           'skip': 0,
  //           'province': 'JAWA TENGAH',
  //           'city': 'KLATEN'
  //         });

  //     print('response: ${response.data['data']}');

  //     result = HealthFacilities.fromJson(response.data);

  //     // return result;
  //   } catch (e) {
  //     throw 'Error: $e';
  //   }
  //   return result;
  // }
}
