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
  bool checkBook = false;
  History? booking;
  bool checkHistory = false;
  History? history;
  bool? expiredSession;
  final formatter = DateFormat('d MMMM yyyy', 'id');

  // read history
  Future<TiketVaksinModel> getTiketHistory() async {
    try {
      apiState = MyState.loading;
      _tiketVaksin = await tiketService.getTiketVaksin();
      checkBooking();
      checkHistory2();
      apiState = MyState.none;
      notifyListeners();
    } on DioError catch (e) {
      return e.error;
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
      return e.error;
    }
  }

  checkBooking() {
    booking = tiketVaksin.data!.history!.firstWhere(
      (e) => e.booking?.status == 'OnProcess',
      orElse: () => History(),
    );
    booking?.status != null
        ? checkBook = true
        : checkBook = false;
    print('ChecBook = $checkBook');
    notifyListeners();
  }
   checkHistory2() {
    history = tiketVaksin.data!.history!.firstWhere(
      (e) => e.booking?.status != 'OnProcess',
      orElse: () => History(),
    );
    
    history?.status != null
        ? checkHistory = true 
        : checkHistory = false;
    print('ChecHistory = ${checkHistory}');
    notifyListeners();
   }

  // checkBookDate(History historyDate) {
  //   final dt1 = DateTime.parse(historyDate.booking!.session!.date!.split('T')[0]);
  //   final dnow = DateTime.now();
  //   final dt2 = DateTime(dnow.year, dnow.month, dnow.day);
  //   // print(dt1);
  //   // print(dt2);
  //   if (dt1.compareTo(dt2) == 0) {
  //     print("Both date time are at same moment.");
  //     expiredSession = false;
  //   }
  //   if (dt1.compareTo(dt2) < 0) {
  //     print("DT1 is before DT2");
  //     expiredSession = false;
  //   }
  //   if (dt1.compareTo(dt2) > 0) {
  //     print("DT1 is after DT2");
  //     expiredSession = true;
  //   }
  // }
}
