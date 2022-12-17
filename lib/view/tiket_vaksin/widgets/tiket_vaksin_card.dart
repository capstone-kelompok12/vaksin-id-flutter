import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/models/tiket_vaksin/tiket_vaksin_model.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/tiket_vaksin_detail.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

class TiketVaksinCard extends StatelessWidget {
  final String nama;
  final History history;
  const TiketVaksinCard({
    super.key,
    required this.history,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TiketVaksinDetail(
                history: history,
                nama: nama,
              ),
            ),
          );
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
                  color: history.status == 'OnProcess'
                      ? const Color(0xffFFE082)
                      : history.status == 'Accepted'
                          ? const Color(0xffCEFFAC)
                          : history.status == 'Rejected'
                              ? const Color(0xffFFDAD6)
                              : const Color(0xffE1E3DE),
                ),
                child: Center(
                  child: Text(
                    history.status == 'OnProcess'
                        ? 'Menunggu Konfirmasi'
                        : history.status == 'Accepted'
                            ? 'Telah diterima'
                            : history.status == 'Rejected'
                                ? 'Telah ditolak'
                                : 'Dibatalkan',
                    style: history.status == 'OnProcess'
                        ? TextStyle(
                            color: const Color(0xff564500),
                            fontWeight: medium,
                          )
                        : history.status == 'Accepted'
                            ? TextStyle(
                                color: const Color(0xff285E00),
                                fontWeight: medium,
                              )
                            : history.status == 'Rejected'
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
              history.status == 'Accepted'
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
                                history.booking!.queue.toString(),
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
                    history.booking!.session!.vaccine!.name!,
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
                          'Dosis ${history.booking!.session!.dose!}',
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
                          '${history.booking!.healthFacilities!.name}',
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
                        Consumer<TiketVaksinViewModel>(
                          builder: (context, format, child) => Text(
                            format.formatter.format(
                              DateTime.parse(history.booking!.session!.date!
                                  .split('T')[0]),
                            ),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
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
                          '${history.booking!.session!.startSession} - ${history.booking!.session!.endSession} WIB',
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
