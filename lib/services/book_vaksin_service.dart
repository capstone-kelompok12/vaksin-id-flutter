import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/booking/booking_session_model.dart';
import 'package:vaksin_id_flutter/models/booking/user_model.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';

class BookVaksinService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app//api/v1';
  final dio = Dio();

  Future<BookingModel> getPenerimaData(String? nik) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token').toString();
    late Response response;
    try {
      response = await dio.get(
        "$baseURL/profile/check/$nik",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('penerima vaksin: ${response.data['data']}');
    } on DioError catch (e) {
      throw 'Error: $e';
    }

    return BookingModel.fromJson(response.data['data']);
  }

  Future createBooking(List<BookingModel> bookingList) async {
    SharedService sharedService = SharedService();
    String token = sharedService.getToken().toString();
    try {
      final response = await dio.post(
        '$baseURL/users/bookings',
        // data: bookingList,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final result = BookingModel.fromJson(response.data);
      print('response: ${result}');
      return result;
    } on DioError catch (error) {
      if (error.response!.statusCode == 401) {
        throw Error();
      }
      print(error);
      throw Error();
    }
  }
}
