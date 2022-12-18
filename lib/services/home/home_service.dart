import 'package:dio/dio.dart';
import 'package:vaksin_id_flutter/models/home/news_model.dart';
import 'package:vaksin_id_flutter/models/home/nearby_healt_facilities_model.dart';
import 'package:vaksin_id_flutter/models/home/home_vaccine_model.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';

class HealthFaciApi {
  String messageAPI = '';
  final dio = Dio(BaseOptions(
    baseUrl: "https://vaksin-y3awbiupna-as.a.run.app/api/v1",
  ));

  HealthFaciApi() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = SharedService();
        final String? token = await prefs.getToken();
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<NearbyHealthFacilitiesModel> getNearbyHealthFacilities(
      double lat, double long) async {
    try {
      final response = await dio
          .post('/profile/nearby', data: {"latitude": lat, "longitude": long});

      final result = NearbyHealthFacilitiesModel.fromJson(response.data);
      print('response: $response');
      return result;
    } on DioError catch (error) {
      print(error);
      throw Error();
    }
  }

  Future<VaccineModel> getVaccine() async {
    try {
      final response = await dio.get('/dashboard/vaccines/amount');

      final result = VaccineModel.fromJson(response.data);

      return result;
    } catch (e) {
      throw 'Error: $e';
    }
  }

  Future<List<NewsModel>> getNewsVaccine() async {
    const String baseUrl =
        'https://newsapi.org/v2/everything?q=covid&language=id&apiKey=23b92eb137c74f6eab5f15055aa1de69';
    final dio = Dio();
    var response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['articles'];
      return data.map((item) => NewsModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load character');
    }
  }
}
