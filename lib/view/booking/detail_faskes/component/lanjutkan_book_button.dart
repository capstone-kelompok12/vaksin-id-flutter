import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/booking/book_vaksin/book_vaksin_screen.dart';
import 'package:vaksin_id_flutter/view_model/booking/book_vaksin_view_model.dart';
import 'package:vaksin_id_flutter/view_model/booking/detail_faskes_view_model.dart';

class LanjutkanBookButton extends StatelessWidget {
  const LanjutkanBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<DetailFasKesViewModel>(
            builder: (context, detail, child) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Kapasitas 49/90',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF006D39),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Consumer<BookVaksinViewModel>(
                    builder: (context, book, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006D39),
                      ),
                      onPressed: detail.selectWaktu != null
                          ? () {
                              book.penerimaVaksin = [];
                              book.bookingList = [];
                              book.addPenerima(
                                detail.detailHf!.nik!,
                                detail.detailHf!.fullname!,
                                detail.selectSession!.iD!,
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BookVaksinScreen(),
                                ),
                              );
                            }
                          : null,
                      child: const Text(
                        'Lanjutkan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
