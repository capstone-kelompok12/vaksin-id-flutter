import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vaksin_id_flutter/models/home/sort_distance_health_facilities_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';
import 'package:vaksin_id_flutter/view_model/home/home_view_model.dart';

import '../../models/session_model.dart';

class DetailFasKesViewModel with ChangeNotifier {
  MyState myState = MyState.none;

  // hardcode list item
  final List<String> _vaksin = [
    'Sinovac',
    'Moderna',
    'Ptfizer',
  ];
  List<String> get vaksin => _vaksin;
  final List<String> _dosis = [
    'Dosis 1',
    'Dosis 2',
    'Dosis 3',
  ];
  List<String> get dosis => _dosis;
  final List<String> _tanggal = [
    '27 Desember 2022',
    '28 Desember 2022',
  ];
  List<String> get tanggal => _tanggal;
  final List<String> _waktu = [
    '08.00 - 11.00',
    '13.00 - 16.00',
  ];
  List<String> get waktu => _waktu;

  // select list form
  String? _selectVaksin;
  String? get selectVaksin => _selectVaksin;
  int? _selectDosis;
  int? get selectDosis => _selectDosis;
  String? _selectTanggal;
  String? get selectTanggal => _selectTanggal;
  String? _selectWaktu;
  String? get selectWaktu => _selectWaktu;
  String? _idSession;
  String? get idSession => _idSession;

  void selectJenisVaksin(value) {
    _selectVaksin = value;
    notifyListeners();
  }

  void selectDosisVaksin(value) {
    _selectDosis = value;
    notifyListeners();
  }

  void selectTanggalVaksin(value) {
    _selectTanggal = value;
    notifyListeners();
  }

  void selectWaktuVaksin(value) {
    _selectWaktu = value;
    notifyListeners();
  }

  void getClear() {
    selectJenisVaksin(null);
    selectDosisVaksin(null);
    selectTanggalVaksin(null);
    selectWaktuVaksin(null);
  }

  // // get session
  // List<Session> sessionVaccine = [];
  // addsessionByVaccine() async {
  //   sessionVaccine.clear();
  //   for
  // }

  // get detail from home screen
  final HomeViewModel homeHf = HomeViewModel();
  SortDistanceHealthFacilities? _detailHf;
  SortDistanceHealthFacilities? get detailHf => _detailHf;
  List<Vaccine>? _detailVaccine;
  List<Vaccine>? get detailVaccine => _detailVaccine;
  Map<String, Vaccine> vaccineMap = {};
  final formatter = DateFormat('dd MMM yyyy');

  getDetailHealthFacilities(
      List<SortDistanceHealthFacilities> data, String name) async {
    myState = MyState.loading;
    _detailHf = data.firstWhere((e) => e.name == name);
    for (var item in detailHf!.vaccine!) {
      vaccineMap[item.name!] = item;
    }
    _detailVaccine = vaccineMap.values.toList();
    _detailVaccine?.forEach((element) {
      print(element.name);
    });
    myState = MyState.none;
    notifyListeners();
  }

  List<Vaccine>? listVaccine;
  getVaccineDose() {
    // final vaccineList = data.where((e) => e.name == vaccine);
    listVaccine = detailHf!.vaccine!.where((e) => e.name == selectVaksin).toList();
    // getVaccineDate();
    listVaccine?.forEach((element) {
      print('vaccineDose: ${element.dose}');
    });
    notifyListeners();
  }

  List<Session>? listSession;
  Map<String, Session> sessionMap = {};
  getVaccineSession(int dose) {
    final selectedVaccineDose = listVaccine!.firstWhere((e) => e.dose == dose);
    for (var item in selectedVaccineDose.session!) {
      sessionMap[item.sessionName!] = item;
    }
    listSession = sessionMap.values.toList();
    print('data: ${listSession}');
    notifyListeners();
  }
}
