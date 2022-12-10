import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/riwayat_tiket/riwayat.dart';
import 'package:vaksin_id_flutter/view/riwayat_tiket/tiket_vaksin.dart';

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
        title: Text('Tiket'),
        bottom: TabBar(
          controller: tabController,
          tabs: const <Widget>[
            Tab(
              child:
                  Text("Tiket Vaksin", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Riwayat", style: TextStyle(color: Colors.black)),
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
