import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/home/news_model.dart';
import 'package:vaksin_id_flutter/models/nearby_healt_facilities_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';
// import '../models/home_model.dart';

class HealthFaciApi {
  String messageAPI = '';
  // String baseUrl = 'https://kipi.covid19.go.id/api/get-faskes-vaksinasi?skip=0&province=JAWA+TENGAH&city=KLATEN';
  final dio = Dio(BaseOptions(
    baseUrl: "https://vaksin-y3awbiupna-as.a.run.app/api/v1",
  ));

  HealthFaciApi() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // final prefs = await SharedPreferences.getInstance();
        // final String token = prefs.getString('token') ?? "";
        const String token =
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJOaWtVc2VyIjoiMzE3NTA4MTExMTAwMDA3MCIsIkVtYWlsIjoiYW5jYXNAZ21haWwuY29tIiwiZXhwIjoxNjcwNzAxNTQzfQ.E5U1aULQ_NeTZ7nX3PqpqinycjaPH-UlJZ10AVplEaM';
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<NearbyHealthFacilitiesModel> getNearbyHealthFacilities() async {
    try {
      final response = await Dio().get(
          'https://kipi.covid19.go.id/api/get-faskes-vaksinasi',
          queryParameters: {
            'skip': 0,
            'province': 'DKI JAKARTA',
            'city': 'JAKARTA SELATAN'
          });

      final result = NearbyHealthFacilitiesModel.fromJson(response.data);
      print('response: ${result}');
      return result;
    } on DioError catch (error) {
      if (error.response!.statusCode == 401) {
        messageAPI = 'expired';
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

  Future<NewsModel> getNewsVaccine() async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/everything?q=covid&language=id&apiKey=23b92eb137c74f6eab5f15055aa1de69');
      final result = NewsModel.fromJson(response.data);
      return result;
    } catch (e) {
      throw 'Error: $e';
    }
  }
}
