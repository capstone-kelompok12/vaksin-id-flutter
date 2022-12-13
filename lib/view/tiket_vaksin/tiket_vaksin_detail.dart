import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';

class TiketVaksinDetail extends StatelessWidget {
  final String vaksin;
  final String statusTiket;
  const TiketVaksinDetail({
    super.key,
    required this.statusTiket,
    required this.vaksin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Vaksinasi',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 36,
              color: statusTiket == 'menunggu'
                  ? const Color(0xffFFE082)
                  : statusTiket == 'diterima'
                      ? const Color(0xffCEFFAC)
                      : statusTiket == 'ditolak'
                          ? const Color(0xffFFDAD6)
                          : const Color(0xffE1E3DE),
              child: Center(
                child: Text(
                  statusTiket == 'menunggu'
                      ? 'Menunggu Konfirmasi'
                      : statusTiket == 'diterima'
                          ? 'Telah diterima'
                          : statusTiket == 'ditolak'
                              ? 'Telah ditolak'
                              : 'Dibatalkan',
                  style: statusTiket == 'menunggu'
                      ? TextStyle(
                          color: const Color(0xff564500),
                          fontWeight: medium,
                        )
                      : statusTiket == 'diterima'
                          ? TextStyle(
                              color: const Color(0xff285E00),
                              fontWeight: medium,
                            )
                          : statusTiket == 'ditolak'
                              ? TextStyle(
                                  color: const Color(0xff93000A),
                                  fontWeight: medium,
                                )
                              : TextStyle(
                                  color: const Color(0xff454744),
                                  fontWeight: medium,
                                ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  statusTiket == 'diterima'
                      ? Container(
                          margin: const EdgeInsets.only(
                            top: 12,
                            bottom: 8,
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  color: Color(0xffA1C9FF),
                                ),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 24,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10),
                                  ),
                                  color: Color(0xffD2E4FF),
                                ),
                                child: Center(
                                  child: Text(
                                    'No. Antrian',
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  Center(
                    child: Text(
                      'Sinovac',
                      style: blackTextStyle.copyWith(
                        fontSize: 22,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  listVaksin(
                    title: 'Dosis',
                    subtitle: 'Pertama',
                  ),
                  listVaksin(
                    title: 'Tanggal',
                    subtitle: 'Pertama',
                  ),
                  listVaksin(
                    title: 'Fasilitas Kesehatan',
                    subtitle: 'RS. Pondok Indah',
                  ),
                  listVaksin(
                    title: 'Sesi Waktu ',
                    subtitle: '08.00 - 11.00 WIB',
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Divider(
                    color: Color(0xffC5C7C2),
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  receiveVaksin(
                    nik: '320310030303001',
                    nama: 'Budi Sudarsono',
                  ),
                  receiveVaksin(
                    nik: '320310030303001',
                    nama: 'Bakayo Saka',
                  ),
                  receiveVaksin(
                    nik: '320310030303001',
                    nama: 'Lionel Messi',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor,
                  side: BorderSide(color: redColor),
                ),
                onPressed: () {},
                child: Text(
                  'Batal',
                  style: redTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listVaksin({required String title, required String subtitle}) {
  return Container(
    margin: const EdgeInsets.only(
      top: 6,
      left: 16,
      right: 16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
        Text(
          subtitle,
          style: blackTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

Widget receiveVaksin({required String nik, required String nama}) {
  return Container(
    margin: const EdgeInsets.only(
      top: 12,
      left: 16,
      right: 16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nik,
          style: blackTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        Text(
          nama,
          style: blackTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        const Divider(
          color: Color(0xffC5C7C2),
          thickness: 1,
        ),
      ],
    ),
  );
}
