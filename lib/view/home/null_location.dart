import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/component/bottom_navigation_bar_screen.dart';
import 'package:vaksin_id_flutter/view/home/home_screen.dart';
import 'package:vaksin_id_flutter/view_model/bottom_navigation/bottomnav_view_model.dart';

import '../../styles/theme.dart';

class NullLocation extends StatelessWidget {
  const NullLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Fasilitas Kesehatan Terdekat'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/nullLocation.png',
            width: 196, height: 196,),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 16),
              child: Text('Yah, kamu belum set lokasi, nih'),
            ),
            Consumer<BottomnavViewModel>(
              builder: (context, value, _) =>
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor, 
                ),
                onPressed: () => value.setIndex(0), 
                child: const Text('Set Lokasi Yuk')),
            )
          ],
        ),
      ),
    );
  }
}