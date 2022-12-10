import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/user_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';

class BookVaksinService {
  final baseURL = 'https://vaksin-y3awbiupna-as.a.run.app/';

  getUser() async {
    // String token = prefs.getString('token').toString();
    try {
      final response = await Dio().get(
        "$baseURL/api/v1/profile",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // 'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final bookingList = (response.data['data'] as List)
            .map((e) => UserModel.fronJson)
            .toList();
        return bookingList;
      }
    } on Exception catch (e) {
      if (e is DioError) {}
    }
  }
}
