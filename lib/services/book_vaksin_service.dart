import 'package:dio/dio.dart';
import 'package:vaksin_id_flutter/models/detail_health_facilities_model.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';

class BookVaksinService {
  final dio = Dio(BaseOptions(
    baseUrl: "https://vaksin-y3awbiupna-as.a.run.app/api/v1",
  ));

  BookVaksinService() {
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

  Future<DetailHealthFacilities> getDetailHealthFacilitiesAPI (String nameHealthFacilities) async {
    try {
      final response = await dio.get('/healthfacilities/$nameHealthFacilities');
      print('object');
      final result = DetailHealthFacilities.fromJson(response.data);
      return result;
    } catch (e) {
      throw 'Error: $e';
    }
  }
}
