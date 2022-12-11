import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: BottomNavigationBar(
        backgroundColor: const Color(0x00eaffea),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.vaccines_outlined), label: 'Book'),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined), label: 'Tiket'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
