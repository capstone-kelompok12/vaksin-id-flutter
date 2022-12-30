import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/models/tiket_vaksin/tiket_vaksin_model.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/widgets/cancel_book.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

class TiketVaksinDetail extends StatelessWidget {
  final String nama;
  final History history;
  const TiketVaksinDetail({
    super.key,
    required this.history,
    required this.nama,
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
              // color: history.booking!.status == 'OnProcess'
              //     ? const Color(0xffFFE082)
              //     : history.booking!.status == 'Accepted'
              //         ? const Color(0xffCEFFAC)
              //         : history.booking!.status == 'Rejected'
              //             ? const Color(0xffFFDAD6)
              //             : const Color(0xffE1E3DE),
              color:
                  history.status == 'OnProcess' || history.status == 'Attended'
                      ? history.booking!.status == 'Accepted'
                          ? const Color(0xffCEFFAC)
                          : const Color(0xffFFE082)
                      : history.booking!.status == 'Accepted'
                          ? const Color(0xffE1E3DE)
                          : history.booking!.status == 'Rejected'
                              ? const Color(0xffFFDAD6)
                              : const Color(0xffFFDAD6),
              child: Center(
                // child: Text(
                // history.booking!.status == 'OnProcess'
                //     ? 'Menunggu Konfirmasi'
                //     : history.booking!.status == 'Accepted'
                //         ? 'Telah diterima'
                //         : history.booking!.status == 'Rejected'
                //             ? 'Telah Rejected'
                //             : 'Dibatalkan',
                child: Text(
                  history.status == 'OnProcess' || history.status == 'Attended'
                      ? history.booking!.status == 'Accepted'
                          ? 'Telah diterima'
                          : 'Menunggu Konfirmasi'
                      : history.booking!.status == 'Accepted'
                          ? 'Dibatalkan'
                          : history.booking!.status == 'Rejected'
                              ? 'Telah ditolak'
                              : '',
                  style: history.booking!.status == 'OnProcess'
                      ? TextStyle(
                          color: const Color(0xff564500),
                          fontWeight: medium,
                        )
                      : history.booking!.status == 'Accepted'
                          ? TextStyle(
                              color: const Color(0xff285E00),
                              fontWeight: medium,
                            )
                          : history.booking!.status == 'Rejected'
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
                  history.booking!.status == 'Accepted'
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
                                    '${history.booking!.queue}',
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
                      '${history.booking!.session!.vaccine!.name}',
                      style: blackTextStyle.copyWith(
                        fontSize: 22,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  listVaksin(
                    title: 'Dosis',
                    subtitle: 'Dosis ${history.booking!.session!.dose}',
                  ),
                  Consumer<TiketVaksinViewModel>(
                    builder: (context, format, child) => listVaksin(
                      title: 'Tanggal',
                      subtitle: format.formatter.format(
                        DateTime.parse(
                            history.booking!.session!.date!.split('T')[0]),
                      ),
                    ),
                  ),
                  listVaksin(
                    title: 'Fasilitas Kesehatan',
                    subtitle: '${history.booking!.healthFacilities!.name}',
                  ),
                  listVaksin(
                    title: 'Sesi Waktu ',
                    subtitle:
                        '${history.booking!.session!.startSession} - ${history.booking!.session!.endSession}',
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Divider(
                    color: Color(0xffC5C7C2),
                    thickness: 3,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 4, left: 16),
                    child: Text(
                      'Penerima Vaksin',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  receiveVaksin(
                    nik: '${history.booking!.nikUser}',
                    nama: nama,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: history.booking!.status == 'OnProcess'
          ? Container(
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
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor,
                    side: BorderSide(color: redColor),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      enableDrag: false,
                      isDismissible: false,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(28),
                        ),
                      ),
                      context: context,
                      builder: (context) => CancelBook(
                        nik: history.nikUser!,
                        bookingId: history.idBooking!,
                        idSession: history.booking!.session!.iD!,
                      ),
                    );
                  },
                  child: Text(
                    'Batal',
                    style: redTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
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
