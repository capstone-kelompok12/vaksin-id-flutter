import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileViewModel extends ChangeNotifier {
  final List<String> _jenisKelamin = [
    'Laki-laki',
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
