import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/user_model.dart';
import 'package:vaksin_id_flutter/services/profile/shared_service.dart';

class UserService {
  final String baseUrl = 'https://vaksin-y3awbiupna-as.a.run.app/api/v1';
  final Dio dio = Dio();

  // getUserProfile() async {
  //   SharedService sharedService = SharedService();
  //   String token = sharedService.getToken().toString();
  //   try {
  //     final response = await Dio().get(
  //       '$baseUrl/profile',
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': 'Bearer $token',
  //         },
  //       ),
  //     );
  //     print('getuser : $token');
  //     if (response.statusCode == 200) {
  //       final usersProfile = (response.data['data'] as List)
  //           .map(
  //             (e) => UserModel.fromJson(e),
  //           )
  //           .toList();
  //       print(usersProfile);
  //       return usersProfile;
  //     }
  //   } catch (_) {}
  // }

  Future<UserModel> getUserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('Token').toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/profile';
      final response = await dio.get(url);
      print(response);

      final data = response.data;
      return UserModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<void> editUserProfile(UserModel user) async {
    SharedService sharedService = SharedService();
    String token = sharedService.getToken().toString();
    try {
      await Dio().put(
        '$baseUrl/profile',
        data: user.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      if (e is DioError) {
        throw e.response!.data['error'].toString();
      }
    }
  }
}
