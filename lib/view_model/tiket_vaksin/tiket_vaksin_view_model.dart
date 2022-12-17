import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vaksin_id_flutter/models/booking/penerima_vaksin_model.dart';
import 'package:vaksin_id_flutter/models/tiket_vaksin/tiket_vaksin_model.dart';
import 'package:vaksin_id_flutter/services/booking/book_vaksin_service.dart';
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
      // print(jsonEncode(tiketVaksin));
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

  // read penerima
  late PenerimaVaksinModel _penerima;
  PenerimaVaksinModel get penerima => _penerima;
  BookVaksinService bookService = BookVaksinService();
  checkNIK(String nik) async {
    try {
      apiState = MyState.loading;
      _penerima = await bookService.getPenerimaData(nik);
      apiState = MyState.none;
      print(penerima.nama);
    } catch (e) {
      apiState = MyState.error;
      rethrow;
    }
    notifyListeners();
  }

  // add penerima to show in detail
  // late List penerimaVaksin;
  // void addPenerima(String nik, String nama, String idSession) {
  //   penerimaVaksin.add(
  //     PenerimaVaksinModel(
  //       nik: nik,
  //       nama: nama,
  //     ),
  //   );
  //   notifyListeners();
  // }

  final formatter = DateFormat('d MMMM yyyy', 'id');
}
