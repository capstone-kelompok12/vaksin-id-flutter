import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaksin_id_flutter/models/profile/edit_profile_model.dart';
import 'package:vaksin_id_flutter/models/profile/profile_model.dart';
import 'package:vaksin_id_flutter/services/profile/profile_service.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';
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

  Future<void> editUsersProfile(EditProfileModel update) async {
    print(update.nik);
    print(update.email);
    print(update.birthdate);
    print(update.fullname);
    print(update.gender);
    print(update.password);
    print(update.phonenum);
    await profileService.editUserProfile(update);
    notifyListeners();
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

  String? selectDate;
  final dateFormat = DateFormat('yyyy-MM-dd');
  String birthday = DateFormat('yyyy-MM-dd').format(DateTime.now());

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

  dateBirthday(DateTime date) {
    selectDate = DateFormat('yyyy-MM-dd').format(date);
    notifyListeners();
    return selectDate;
  }

  checkGender() {
    _selectjenisKelamin =
        profile.dataUser!.gender == 'P' ? 'Perempuan' : 'Laki - laki';
  }
}
