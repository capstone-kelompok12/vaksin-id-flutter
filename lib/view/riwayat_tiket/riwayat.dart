import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaksin_id_flutter/view/riwayat_tiket/tiket_vaksin.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tiket Vaksinasi"),
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
