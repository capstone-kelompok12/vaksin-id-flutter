import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaksin_id_flutter/models/profile/profile_model.dart';
import 'package:vaksin_id_flutter/models/user_model.dart';
import 'package:vaksin_id_flutter/services/profile/profile_service.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/auth/login_screen.dart';
import 'package:vaksin_id_flutter/view/component/snackbar_message.dart';

class ProfileViewModel extends ChangeNotifier {
  final profileService = ProfileService();
  ProfileModel _profile = ProfileModel();
  ProfileModel get profile => _profile;

  void getUsersProfile(context) async {
    try {
      final getProfile = await profileService.getUserProfile();
      _profile = getProfile;
      notifyListeners();
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        final pref = SharedService();
        pref.deleteToken();
        snackbarMessage(context, 'Token Expired');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      }
    }
  }

  editUsersProfile(Data update) async {
    await profileService.editUserProfile(update);
  }

  final List<String> _jenisKelamin = [
    'Laki - laki',
    'Perempuan',
  ];
  List<String> get jenisKelamin => _jenisKelamin;

  String? _selectjenisKelamin;
  String? get selectjenisKelamin => _selectjenisKelamin;

  bool passwordView = true;
  bool passwordView2 = true;

  DateTime? selectDate;
  late String birthday;

  pilihJenisKelamin(value) {
    _selectjenisKelamin = value;
    notifyListeners();
    return _selectjenisKelamin;
  }

  void showPassword() {
    passwordView = !passwordView;
    notifyListeners();
  }

  void showPassword2() {
    passwordView2 = !passwordView2;
    notifyListeners();
  }

  void dateBirthday() {
    birthday = DateFormat('dd/MM/yyyy').format(selectDate!);
    notifyListeners();
  }

  checkGender() {
    _selectjenisKelamin =
        profile.dataUser!.gender == 'P' ? 'Perempuan' : 'Laki-laki';
  }
}
