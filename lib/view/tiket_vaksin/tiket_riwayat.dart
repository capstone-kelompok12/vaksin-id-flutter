import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:underline_indicator/underline_indicator.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/riwayat.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/tiket_vaksin_screen.dart';

class RiwayatTiket extends StatefulWidget {
  const RiwayatTiket({super.key});

  @override
  State<RiwayatTiket> createState() => _riwayat_tiket();
}

class _riwayat_tiket extends State<RiwayatTiket> with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  searchBar() {
    return TextField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          prefixIcon: const Icon(Icons.search)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
          child: Text(
            'Tiket Vaksinasi',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          unselectedLabelColor: Colors.black,
          indicator: //ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0)))),

              UnderlineIndicator(
                  strokeCap: StrokeCap.round,
                  borderSide: BorderSide(width: 5.0, color: Colors.green),
                  insets: EdgeInsets.symmetric(horizontal: 60)),
          labelColor: Colors.green,
          tabs: const <Widget>[
            Tab(
              child: Text("Tiket Vaksin"),
            ),
            Tab(
              child: Text("Riwayat"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[TiketVaksinPage(), RiwayatPage()],
      ),
    );
  }
}
