import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/models/booking/booking_session_model.dart';
import 'package:vaksin_id_flutter/models/booking/detail_health_facilities_model.dart';
import 'package:vaksin_id_flutter/models/booking/user_model.dart';
import 'package:vaksin_id_flutter/services/book_vaksin_service.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';

class BookVaksinViewModel extends ChangeNotifier {
  final bookVaksinService = BookVaksinService();

  DetailHealthFacilities? detailHealthFacilities;
  MyState myState = MyState.none;

  //CheckBox
  bool isChecked = false;
  bool doubleCheck = false;

  void doubleCheckBook() {
    isChecked = !isChecked;
    notifyListeners();
  }

  late BookingModel _penerima;
  BookingModel get penerima => _penerima;

  checkNIK(String nik) async {
    try {
      myState = MyState.loading;
      _penerima = await bookVaksinService.getPenerimaData(nik);
      myState = MyState.none;
      print(penerima.nama);
    } catch (e) {
      myState = MyState.error;
      rethrow;
    }
    notifyListeners();
  }

  // List<PenerimaVaksinModel> penerimaVaksin = [
  //   PenerimaVaksinModel(nik: '320310030303001', nama: 'Jonathan Christie'),
  //   PenerimaVaksinModel(nik: '320310030303002', nama: 'Kevin Sanjaya'),
  //   PenerimaVaksinModel(nik: '320310030303004', nama: 'Hendra Setiawan'),
  //   PenerimaVaksinModel(nik: '320310030303001', nama: 'Jonathan Christie'),
  // ];

  late List<BookingModel> penerimaVaksin;
  // List<BookingModel> get penerimaVaksin => _penermiaVaksin;

  void addPenerima(String nik, String nama, String idSession) {
    penerimaVaksin.add(BookingModel(
      nik: nik,
      nama: nama,
      idSession: idSession,
    ));
    notifyListeners();
  }

  void deletePenerima(int index) {
    penerimaVaksin.removeAt(index);
    notifyListeners();
  }

  // condition
  late bool search;
  late bool found;
  void searchCondition(bool searchUser, bool foundUser) {
    search = searchUser;
    found = foundUser;
    notifyListeners();
  }

  createBooking(List<BookingModel> booking) async {
    return await bookVaksinService.createBooking(booking);
  }
}

// class PenerimaVaksinModel {
//   String nik, nama;

//   PenerimaVaksinModel({required this.nik, required this.nama});
// }
