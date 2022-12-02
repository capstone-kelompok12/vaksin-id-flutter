import 'package:flutter/material.dart';
import '../models/home_model.dart';
import '../services/home_service.dart';

class HomeViewModel extends ChangeNotifier {
  final healtFaci = HealthFaciApi();
  HealthFacilities? listHealthFaci;

  getHealthFacilities() async {
    try {
      listHealthFaci = await healtFaci.getListHealthFaci();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
