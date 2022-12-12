import 'package:flutter/cupertino.dart';
import 'package:vaksin_id_flutter/models/health_facilities_byname_model.dart';
import 'package:vaksin_id_flutter/models/health_facilities_model.dart';
import 'package:vaksin_id_flutter/models/home/sort_distance_health_facilities.dart';
import 'package:vaksin_id_flutter/services/detail_faskes_service.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';
import 'package:vaksin_id_flutter/view_model/home_view_model.dart';

import '../../models/home/nearby_healt_facilities_model.dart';

class DetailFasKesViewModel with ChangeNotifier {
  MyState myState = MyState.none;
  final List<String> _vaksin = [
    '1',
    '2',
    '3',
  ];
  List<String> get vaksin => _vaksin;

  String? _selectVaksin;
  String? get selectVaksin => _selectVaksin;
  String? _selectDosis;
  String? get selectDosis => _selectDosis;
  String? _selectTanggal;
  String? get selectTanggal => _selectTanggal;
  String? _selectWaktu;
  String? get selectWaktu => _selectWaktu;

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

  // Read Service
  final DetailFasKesService detailFasKes = DetailFasKesService();
  HealthFacilitiesByNameModel _detail =
      HealthFacilitiesByNameModel(Address: AddressModel(), Vaccine: []);
  HealthFacilitiesByNameModel get detail => _detail;
  final HomeViewModel homeHf = HomeViewModel();
  SortDistanceHealthFacilities? _detailHf; 
  SortDistanceHealthFacilities? get detailHf => _detailHf; 

  getDetailHealthFacilitiesAPI(String? nama) async {
    try {
      myState = MyState.loading;
      _detail = await detailFasKes.getDetailHealthFacilities(nama);
      myState = MyState.none;
    } catch (e) {
      myState = MyState.error;
      rethrow;
    }
    notifyListeners();
  }
  
  getDetailHealthFacilities(List<SortDistanceHealthFacilities> data,String name) async {
      myState = MyState.loading;
      _detailHf = data.firstWhere((e) => e.nama == name, orElse: () {
        return SortDistanceHealthFacilities(nama: 'nama', alamat: 'alamat', jarak: 'jarak', distanceSort: 0);
      },);
      print('detailHf: $detailHf');
      myState = MyState.none;
  }
}
