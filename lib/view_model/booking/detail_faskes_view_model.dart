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
    // listSession.clear();
    // listVaccine.clear();
  }

  // get detail from home screen
  final HomeViewModel homeHf = HomeViewModel();
  SortDistanceHealthFacilities? _detailHf;
  SortDistanceHealthFacilities? get detailHf => _detailHf;
  List<Vaccine>? _detailVaccine;
  List<Vaccine>? get detailVaccine => _detailVaccine;
  Map<String, Vaccine> vaccineMap = {};
  final formatter = DateFormat('d MMMM yyyy', 'id');
  String? changed;

  getDetailHealthFacilities(
      List<SortDistanceHealthFacilities> data, String name) async {
    myState = MyState.loading;
    vaccineMap.clear();
    _detailHf = data.firstWhere((e) => e.name == name);
    for (var item in detailHf!.vaccine!) {
      vaccineMap[item.name!] = item;
    }
    _detailVaccine = vaccineMap.values.toList();
    _detailVaccine?.forEach((element) {
      print('nameVaksin: ${element.name}');
    });
    myState = MyState.none;
    notifyListeners();
  }

  List<Vaccine>? listVaccine;
  getVaccineDose() {
    listVaccine =
        detailHf!.vaccine!.where((e) => e.name == selectVaksin).toList();
    for (var element in listVaccine!) {
      print('vaccineDose: ${element.dose}');
    }
    notifyListeners();
  }

  List<Session>? listSession;
  List<Session>? sessionTime;
  Map<String, Session> sessionMap = {};
  Map<String, Session> timeMap = {};
  getVaccineSession() {
    if (sessionMap.isNotEmpty) {
      listSession?.clear();
      sessionMap.clear();
    }
    final selectedVaccineDose =
        listVaccine?.firstWhere((e) => e.dose == selectDosis);
    for (var item in selectedVaccineDose!.session!) {
      sessionMap[item.date!] = item;
    }
    listSession = sessionMap.values.toList();
    print('session: ${listSession?.length}');
    // for (var element in listSession!) {
    // }
    notifyListeners();
  }

  getVaccineSessionTime() {
    sessionTime = listSession?.where((e) {
      final listDate = formatter.format(DateTime.parse(e.date!.split('T')[0]));
      return listDate == selectTanggal;
    }).toList();
    for (var time in sessionTime!) {
      print('jam: ${time.startSession} - ${time.endSession}');
    }
  }

  Session? selectSession;
  void getIdSession(List<Session> data) {
    selectSession = data.firstWhere((e) {
      final listDate = formatter.format(DateTime.parse(e.date!.split('T')[0]));
      return e.startSession == selectWaktu?.substring(0, 5) &&
          listDate == selectTanggal &&
          e.dose == selectDosis;
    });
    print(selectWaktu!.substring(0, 5));
    print('dateBooking: ${selectSession!.date}');
    notifyListeners();
  }
}
