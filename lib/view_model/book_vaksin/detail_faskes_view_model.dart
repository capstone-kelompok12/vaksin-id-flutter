import 'package:flutter/cupertino.dart';
import 'package:vaksin_id_flutter/models/health_facilities_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';
import 'package:vaksin_id_flutter/services/detail_faskes_service.dart';

class DetailFasKesViewModel with ChangeNotifier {
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

  DetailFasKesService detailFasKes = DetailFasKesService();
  List<Data> _detail = [];
  List<Data> get detail => _detail;

  getDetailHealthFacilities(String? nama) async {
    _detail = await detailFasKes.getDetailHealthFacilities(nama);
    notifyListeners();
  }
}
