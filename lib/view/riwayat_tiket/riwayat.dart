import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaksin_id_flutter/view/riwayat_tiket/tiket_riwayat.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPage();
}

class _RiwayatPage extends State<RiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: Card(
          color: Colors.white,
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  )),
                ),
                // width: double.infinity,
                //padding: EdgeInsets.all(10),
                height: 88,
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    height: 36,
                    child: Text('Menunggu Konfirmasi'),
                  ),
                  Text('SINOVAC')
                ]),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Icon(Icons.bloodtype_rounded),
                          Text('Dosis Pertama'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text('RS. Pondok Indah'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_rounded),
                          Text('Dosis Pertama'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Icon(Icons.access_time_rounded),
                          Text('31 Desember 2022'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
