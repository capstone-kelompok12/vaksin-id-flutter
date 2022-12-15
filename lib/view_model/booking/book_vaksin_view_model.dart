import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/models/booking/booking_session_model.dart';
import 'package:vaksin_id_flutter/models/booking/penerima_vaksin_model.dart';
import 'package:vaksin_id_flutter/services/booking/book_vaksin_service.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';

class BookVaksinViewModel extends ChangeNotifier {
  final bookVaksinService = BookVaksinService();

  MyState myState = MyState.none;

  //CheckBox
  bool isChecked = false;
  bool doubleCheck = false;

  void doubleCheckBook() {
    isChecked = !isChecked;
    notifyListeners();
  }

  // add penerima - checkNIK
  late PenerimaVaksinModel _penerima;
  PenerimaVaksinModel get penerima => _penerima;

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

  // list penerima
  late List bookingList;
  late List penerimaVaksin;

  void addPenerima(String nik, String nama, String idSession) {
    penerimaVaksin.add(
      PenerimaVaksinModel(
        nik: nik,
        nama: nama,
      ),
    );

    bookingList.add(
      PenerimaVaksinModel(
        nik: nik,
        idSession: idSession,
      ),
    );
    notifyListeners();
  }

  void deletePenerima(int index) {
    penerimaVaksin.removeAt(index);
    bookingList.removeAt(index);
    notifyListeners();
  }

  // create booking
  BookingModel bookingModel = BookingModel();
  createBooking() async {
    bookingModel = await bookVaksinService.createBooking(bookingList);
    notifyListeners();
  }

  // condition - after booking between component
  late bool search;
  late bool found;
  void searchCondition(bool searchUser, bool foundUser) {
    search = searchUser;
    found = foundUser;
    notifyListeners();
  }
}
