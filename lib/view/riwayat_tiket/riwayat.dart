import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaksin_id_flutter/view/riwayat_tiket/tiket_riwayat.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPage();
}

class _RiwayatPage extends State<RiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 340,
            width: double.infinity,
            child: Card(
                color: whiteColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
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
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                          height: 36,
                          child: const Center(
                            child: Text('Telah Ditolak',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text('Sinovac',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                )),
                          ),
                        )
                      ]),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                              left: 20,
                            ),
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: const [
                                  Icon(Icons.bloodtype_rounded),
                                  Text(
                                    'Dosis Pertama',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                              left: 20,
                            ),
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: const [
                                  Icon(Icons.location_on_outlined),
                                  Text(
                                    'RS. Pondok Indah',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                              left: 20,
                            ),
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: const [
                                  Icon(Icons.calendar_today_rounded),
                                  Text(
                                    'Dosis Pertama',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                              left: 20,
                            ),
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: const [
                                  Icon(Icons.access_time_rounded),
                                  Text(
                                    '31 Desember 2022',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 340,
            width: double.infinity,
            child: Card(
                color: whiteColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
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
                              color: Colors.grey.shade400,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                          height: 36,
                          child: const Center(
                            child: Text('Dibatalkan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text('Sinovac',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                )),
                          ),
                        )
                      ]),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                              left: 20,
                            ),
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: const [
                                  Icon(Icons.bloodtype_rounded),
                                  Text('Dosis Pertama',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                              left: 20,
                            ),
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: const [
                                  Icon(Icons.location_on_outlined),
                                  Text(
                                    'RS. Pondok Indah',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                              left: 20,
                            ),
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: const [
                                  Icon(Icons.calendar_today_rounded),
                                  Text(
                                    'Dosis Pertama',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                              left: 20,
                            ),
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: const [
                                  Icon(Icons.access_time_rounded),
                                  Text(
                                    '31 Desember 2022',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
