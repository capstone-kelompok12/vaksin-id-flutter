import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaksin_id_flutter/view/riwayat_tiket/riwayat.dart';
import 'package:vaksin_id_flutter/view/riwayat_tiket/tiket_vaksin.dart';

class riwayat_tiket extends StatefulWidget {
  const riwayat_tiket({super.key});

  @override
  State<riwayat_tiket> createState() => _riwayat_tiket();
}

class _riwayat_tiket extends State<riwayat_tiket>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
        title: searchBar(),
        bottom: TabBar(
          controller: tabController,
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
      body: const TabBarView(
        children: <Widget>[TiketVaksinPage(), RiwayatPage()],
      ),
    );
  }
}
