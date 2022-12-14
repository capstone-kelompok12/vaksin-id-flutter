import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/models/booking/detail_health_facilities_model.dart';
import 'package:vaksin_id_flutter/services/book_vaksin_service.dart';

import '../view/component/finite_state.dart';

class BookVaksinViewModel extends ChangeNotifier {
  final bookVaksinService = BookVaksinService();
  bool isChecked = false;
  DetailHealthFacilities? detailHealthFacilities;
  MyState myState = MyState.none;

  void doubleCheckBook() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
