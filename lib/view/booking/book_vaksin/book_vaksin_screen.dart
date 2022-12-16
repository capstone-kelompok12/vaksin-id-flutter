import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/booking/book_vaksin/component/add_member.dart';
import 'package:vaksin_id_flutter/view/booking/book_vaksin/component/book_button.dart';
import 'package:vaksin_id_flutter/view_model/booking/book_vaksin_view_model.dart';
import 'package:vaksin_id_flutter/view_model/booking/detail_faskes_view_model.dart';

class BookVaksinScreen extends StatefulWidget {
  const BookVaksinScreen({super.key});

  @override
  State<BookVaksinScreen> createState() => _BookVaksinScreenState();
}

class _BookVaksinScreenState extends State<BookVaksinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Vaksin'),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 9),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Consumer<DetailFasKesViewModel>(
                    builder: (context, detail, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Faskes
                        const Text(
                          'Fasilitas Kesehatan',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${detail.detailHf!.name}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Vaksin
                        const Text(
                          'Vaksin',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          detail.selectVaksin!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Dosis
                        const Text(
                          'Dosis',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Dosis ${detail.selectDosis}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Tanggal
                        const Text(
                          'Tanggal',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          detail.formatter.format(DateTime.parse(
                              detail.selectTanggal!.split('T')[0])),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Sesi Waktu
                        const Text(
                          'Sesi Waktu',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${detail.selectSession!.startSession} - ${detail.selectSession!.endSession} WIB',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: 4,
                color: const Color(0xFFE1E3DE),
              ),

              // Penerima Vaksin
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Penerima Vaksin',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Consumer<BookVaksinViewModel>(
                        builder: (context, booking, child) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: booking.penerimaVaksin.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          booking.penerimaVaksin[index].nik!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          booking.penerimaVaksin[index].nama!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: booking.penerimaVaksin[index] ==
                                              booking.penerimaVaksin[0]
                                          ? null
                                          : MaterialButton(
                                              color: const Color(0xFFD2E4FF),
                                              shape: const CircleBorder(),
                                              minWidth: 0,
                                              height: 40,
                                              onPressed: () {
                                                booking.deletePenerima(index);
                                              },
                                              child: const Icon(
                                                Icons.close_rounded,
                                                color: Colors.black,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                    color: Color(0xFFC5C7C2), thickness: 1)
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Tambah penerima Vaksin
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Ada penerima vaksin lainnya?',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Tambahan dalam 1 antrian',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(28),
                                  ),
                                ),
                                context: context,
                                builder: (context) => const AddMember(),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color(0xFF717971),
                              ),
                            ),
                            child: const Text(
                              'Tambah',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF006D39),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
      bottomSheet: const BookButton(),
    );
  }
}
