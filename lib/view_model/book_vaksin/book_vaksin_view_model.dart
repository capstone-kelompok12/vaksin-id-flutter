import 'package:flutter/material.dart';

class BookVaksinViewModel extends ChangeNotifier {
  //CheckBox
  bool isChecked = false;
  bool doubleCheck = false;

  void doubleCheckBook() {
    isChecked = !isChecked;
    notifyListeners();
  }

  //
  //
  //
  //
  //
  List<PenerimaVaksinModel> penerimaVaksin = [
    PenerimaVaksinModel(nik: '320310030303001', nama: 'Jonathan Christie'),
    PenerimaVaksinModel(nik: '320310030303002', nama: 'Kevin Sanjaya'),
    PenerimaVaksinModel(nik: '320310030303004', nama: 'Hendra Setiawan'),
    PenerimaVaksinModel(nik: '320310030303001', nama: 'Jonathan Christie'),
  ];
}

class PenerimaVaksinModel {
  String nik, nama;

  PenerimaVaksinModel({required this.nik, required this.nama});
}
