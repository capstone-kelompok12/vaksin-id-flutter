import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/riwayat_vaksin.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/tiket_vaksin.dart';

class TiketVaksinScreen extends StatelessWidget {
  const TiketVaksinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Tiket Vaksinasi',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          bottom: TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: blackColor,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: primaryColor,
                width: 3,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 60.0),
            ),
            tabs: const [
              Tab(
                child: Text(
                  'Tiket Vaksin',
                ),
              ),
              Tab(
                child: Text(
                  'Riwayat Vaksin',
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TiketVaksin(),
            RiwayatVaksin(),
          ],
        ),
      ),
    );
  }
}
