import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/view/home/home_screen.dart';
import 'package:vaksin_id_flutter/view/home/nearby_hf_screen.dart';
import 'package:vaksin_id_flutter/view/profile/profile_screen.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/tiket_vaksin_screen.dart';

class BottomnavViewModel with ChangeNotifier {
  int index = 0;

  List<Widget> listScreen = [
    const HomeScreen(),
    const NearbyHfScreen(),
    const TiketVaksinScreen(),
    const ProfileScreen(),
  ];

  setIndex(int value) {
    index = value;
    notifyListeners();
  }
}
