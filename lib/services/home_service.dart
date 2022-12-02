import 'package:dio/dio.dart';
import '../models/home_model.dart';

class HealthFaciApi {
  // String baseUrl = 'https://kipi.covid19.go.id/api/get-faskes-vaksinasi?skip=0&province=JAWA+TENGAH&city=KLATEN';
  final dio = Dio();

  HealthFaciApi() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<HealthFacilities> getListHealthFaci() async {
    late HealthFacilities result;
    try {
      final response = await Dio().get(
          'https://kipi.covid19.go.id/api/get-faskes-vaksinasi',
          queryParameters: {
            'skip': 0,
            'province': 'JAWA TENGAH',
            'city': 'KLATEN'
          });

      print('response: ${response.data['data']}');

      result = HealthFacilities.fromJson(response.data);

      // return result;
    } catch (e) {
      throw 'Error: $e';
    }
    return result;
  }
}
