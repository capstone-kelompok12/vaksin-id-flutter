import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/tiket_vaksin/tiket_vaksin_model.dart';

class TiketVaksinService {
  final String baseUrl = 'https://vaksin-y3awbiupna-as.a.run.app/api/v1';
  Dio dio = Dio();

  Future<TiketVaksinModel> getTiketVaksin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token').toString();
    try {
      final response = await dio.get(
        '$baseUrl/profile/history',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(token);
      final data = response.data;
      print(data);
      return TiketVaksinModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<void> cancelBooking(
      String nik, String bookingId, String idSession) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token').toString();
    try {
      final response = await dio.put('$baseUrl/users/bookings/$nik/cancel',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
          data: {"booking_id": bookingId, "id_session": idSession});
      print('nik user = $nik');
      print('cancel booking response: ${response.data}');
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }
}
