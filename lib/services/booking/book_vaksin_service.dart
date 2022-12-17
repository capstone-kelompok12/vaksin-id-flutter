import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/booking/booking_session_model.dart';
import 'package:vaksin_id_flutter/models/booking/penerima_vaksin_model.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';

class BookVaksinService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app//api/v1';
  final dio = Dio();

  Future<PenerimaVaksinModel> getPenerimaData(String? nik) async {
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

    return PenerimaVaksinModel.fromJson(response.data['data']);
  }

  // Future createBooking(List bookingList) async {
  //   SharedService sharedService = SharedService();
  //   String token = sharedService.getToken().toString();
  //   late Response response;
  //   final bookingListJson = jsonEncode(bookingList);
  //   print('data booking : $bookingListJson');
  //   try {
  //     response = await dio.post(
  //       '$baseURL/users/bookings',
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //       data: bookingListJson,
  //     );

  //     // final result = BookingModel.fromJson(response.data);
  //     print('response booking: ${response.data}');
  //   } on DioError catch (error) {
  //     // if (error.response!.statusCode == 401) {
  //     //   throw Error();
  //     // }
  //     // print(error);
  //     print(error);
  //     throw Error();
  //   }
  // }

  Future<void> createBooking(List? bookingList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token').toString();
    try {
      final response = await Dio().post(
        "$baseURL/users/bookings",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: jsonEncode(bookingList),
      );
      return response.data['data'];
    } on DioError catch (e) {
      print(e.response!.data['message']);
    }
  }
}
