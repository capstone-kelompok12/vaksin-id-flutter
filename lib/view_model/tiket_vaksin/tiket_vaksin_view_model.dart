import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vaksin_id_flutter/models/tiket_vaksin/tiket_vaksin_model.dart';
import 'package:vaksin_id_flutter/services/shared/shared_service.dart';
import 'package:vaksin_id_flutter/services/tiket_vaksin/tiket_vaksin_service.dart';

class TiketVaksinViewModel extends ChangeNotifier {
  TiketVaksinService tiketService = TiketVaksinService();

  TiketVaksinModel _tiketVaksin = TiketVaksinModel();
  TiketVaksinModel get tiketVaksin => _tiketVaksin;

  Future<TiketVaksinModel> getTiketHistory() async {
    try {
      _tiketVaksin = await tiketService.getTiketVaksin();
      print(jsonEncode(tiketVaksin));
      notifyListeners();
    } on DioError catch (e) {
      rethrow;
    }
    return _tiketVaksin;
  }
}
