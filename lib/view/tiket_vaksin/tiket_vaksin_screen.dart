import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/component/riwayat_vaksin.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/component/tiket_vaksin.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

class TiketVaksinScreen extends StatefulWidget {
  const TiketVaksinScreen({super.key});

  @override
  State<TiketVaksinScreen> createState() => _TiketVaksinScreenState();
}

class _TiketVaksinScreenState extends State<TiketVaksinScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TiketVaksinViewModel>(context, listen: false).getTiketHistory();
  }

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
              insets: const EdgeInsets.symmetric(horizontal: 50.0),
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
