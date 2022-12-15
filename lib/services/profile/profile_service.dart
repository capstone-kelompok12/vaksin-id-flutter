import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/profile/profile_model.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';

import '../../models/profile/edit_profile_model.dart';

class ProfileService {
  final String baseUrl = 'https://vaksin-y3awbiupna-as.a.run.app/api/v1';

  Future<ProfileModel> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token').toString();
    try {
      final response = await Dio().get(
        '$baseUrl/profile',
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
      return ProfileModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<void> editUserProfile(EditProfileModel user) async {
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
      print(user.toJson);
    } catch (e) {
      if (e is DioError) {
        throw e.response!.data['error'].toString();
      }
    }
  }
}
