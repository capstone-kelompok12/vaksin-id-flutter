import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vaksin_id_flutter/models/tiket_vaksin/tiket_vaksin_model.dart';
import 'package:vaksin_id_flutter/services/tiket_vaksin/tiket_vaksin_service.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';

class TiketVaksinViewModel extends ChangeNotifier {
  TiketVaksinService tiketService = TiketVaksinService();
  TiketVaksinModel _tiketVaksin = TiketVaksinModel();
  TiketVaksinModel get tiketVaksin => _tiketVaksin;
  MyState apiState = MyState.none;
  bool? checkBook = false;
  bool? checkHistory = false;
  final formatter = DateFormat('d MMMM yyyy', 'id');

  // read history
  Future<TiketVaksinModel> getTiketHistory() async {
    try {
      apiState = MyState.loading;
      _tiketVaksin = await tiketService.getTiketVaksin();
      checkBookingHistory();
      checkHistory2();
      apiState = MyState.none;
      notifyListeners();
    } on DioError catch (e) {
      rethrow;
    }
    return _tiketVaksin;
  }

  // cancel booking (tiket)
  Future<void> cancelBooking(
      String nik, String bookingId, String idSession) async {
    try {
      apiState = MyState.loading;
      await tiketService.cancelBooking(nik, bookingId, idSession);
      apiState = MyState.none;
    } on DioError catch (e) {
      rethrow;
    }
  }

  checkBookingHistory() {
    final booking = tiketVaksin.data!.history!.firstWhere(
      (e) => e.status == 'OnProcess',
      orElse: () => History(),
    );
    checkBook = booking.status?.isNotEmpty;
    print('ChecBook = $checkBook');
    notifyListeners();
  }
   checkHistory2() {
    final history = tiketVaksin.data!.history!.firstWhere(
      (e) => e.status != 'OnProcess',
      orElse: () => History(),
    );
    
    history.status == null
    ? checkHistory = true : checkHistory = false;
    print('ChecHistory = ${checkHistory}');
    notifyListeners();
   }

  checkBookDate() {
    DateTime dt1 = DateTime.parse("2021-12-23 11:47:00");
    DateTime dt2 = DateTime.parse("2018-02-27 10:09:00");
    if (dt1.compareTo(dt2) == 0) {
      print("Both date time are at same moment.");
    }
    if (dt1.compareTo(dt2) < 0) {
      print("DT1 is before DT2");
    }

    if (dt1.compareTo(dt2) > 0) {
      print("DT1 is after DT2");
    }
  }
}
