import 'package:flutter/cupertino.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';
import 'package:vaksin_id_flutter/services/detail_faskes_service.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin_view_model.dart';

class DetailFasKesViewModel with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  // get vaccine
  final detailFasKes = DetailFasKesService();
  List<VaccineModel> vaccineList = [];
  VaccineModel vaccineModel =
      VaccineModel(id: '', idHospital: '', vacchineName: '', stock: '');

  getvac() async {
    vaccineModel = await detailFasKes.getVaccines();
    return vaccineList;
  }
}
