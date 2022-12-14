import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaksin_id_flutter/models/profile/profile_model.dart';
import 'package:vaksin_id_flutter/services/profile/profile_service.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';
import 'package:vaksin_id_flutter/view/auth/login_screen.dart';

class ProfileViewModel extends ChangeNotifier {
  final profileService = ProfileService();
  ProfileModel _profile = ProfileModel();
  ProfileModel get profile => _profile;

  Future getUsersProfile() async {
    try {
      final getProfile = await profileService.getUserProfile();
      _profile = getProfile;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
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

  void pilihJenisKelamin(value) {
    _selectjenisKelamin = value;
    notifyListeners();
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
}
