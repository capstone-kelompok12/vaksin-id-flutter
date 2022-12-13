import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';

class TiketVaksinCard extends StatelessWidget {
  final String vaksin;
  final String statusTiket;
  const TiketVaksinCard({
    super.key,
    required this.vaksin,
    required this.statusTiket,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.2),
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  color: statusTiket == 'menunggu'
                      ? const Color(0xffFFE082)
                      : statusTiket == 'diterima'
                          ? const Color(0xffCEFFAC)
                          : statusTiket == 'ditolak'
                              ? const Color(0xffFFDAD6)
                              : const Color(0xffE1E3DE),
                ),
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
              SizedBox(
                height: 52,
                width: double.infinity,
                child: Center(
                  child: Text(
                    vaksin,
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Color(0xffC5C7C2),
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.bloodtype,
                          color: blackColor,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Dosis Pertama',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: blackColor,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'RS. Pondok Indah',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.today,
                          color: blackColor,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '30 November 2022',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: blackColor,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '08.00 - 11.00 WIB',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
