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

  // read history
  Future<TiketVaksinModel> getTiketHistory() async {
    try {
      apiState = MyState.loading;
      _tiketVaksin = await tiketService.getTiketVaksin();
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

  final formatter = DateFormat('d MMMM yyyy', 'id');
}
