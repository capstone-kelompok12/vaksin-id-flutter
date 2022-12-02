import 'package:flutter/material.dart';

class BookVaksinViewModel extends ChangeNotifier {
  bool isChecked = false;

  void doubleCheckBook() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
