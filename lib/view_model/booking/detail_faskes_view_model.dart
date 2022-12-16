import 'package:flutter/cupertino.dart';
import 'package:vaksin_id_flutter/models/home/sort_distance_health_facilities_model.dart';
import 'package:vaksin_id_flutter/models/session_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';
import 'package:vaksin_id_flutter/services/booking/detail_faskes_service.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';
import 'package:vaksin_id_flutter/view_model/home_view_model.dart';

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
  String? _selectDosis;
  String? get selectDosis => _selectDosis;
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
  }

  // // get session
  // List<Session> sessionVaccine = [];
  // addsessionByVaccine() async {
  //   sessionVaccine.clear();
  //   for
  // }

  // get detail from home screen
  final DetailFasKesService detailFasKes = DetailFasKesService();
  final HomeViewModel homeHf = HomeViewModel();
  SortDistanceHealthFacilities? _detailHf;
  SortDistanceHealthFacilities? get detailHf => _detailHf;

  getDetailHealthFacilities(
      List<SortDistanceHealthFacilities> data, String name) async {
    myState = MyState.loading;
    _detailHf = data.firstWhere((e) => e.name == name);
    print('Vaccine: ${detailHf!.vaccine!.length}');
    myState = MyState.none;
  }

  Vaccine? vaccineSession;
  getVaccineSession(List<Vaccine> data) async {
    vaccineSession = data.firstWhere((e) => e.name == selectVaksin);
    print('vaccineSession: ${vaccineSession!.session!.length}');
  }
}
