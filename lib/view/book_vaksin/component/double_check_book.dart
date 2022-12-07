import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/component/book_success.dart';
import 'package:vaksin_id_flutter/view/book_vaksin/component/book_unsuccess.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin_view_model.dart';

class DoubleCheckBook extends StatelessWidget {
  const DoubleCheckBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
        color: Color(0xFFFAFAFB),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Icon(
              Icons.drag_handle_rounded,
              color: const Color(0xFF717971).withOpacity(0.4),
              size: 32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: 180,
              width: 250,
              child: Image.asset('assets/doubelCheck.png'),
            ),
          ),
          const Text(
            'Mohon periksa data anda',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            child: Text(
              'Anda hanya dapat membooking 1 vaksin dalam 1 waktu. Anda harus membatalkannya terlebih dahulu jika ingin membooking kembali.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),

          // checkbox
          Consumer<BookVaksinViewModel>(
            builder: (context, book, child) => Container(
              width: double.infinity,
              color: const Color(0xFFE1E3DE),
              child: CheckboxListTile(
                title: const Text(
                  'Saya mengerti! Jangan tampilkan pesan ini lagi.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                value: book.isChecked,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color(0xFF006D39),
                onChanged: (bool? value) {
                  book.doubleCheckBook();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Consumer<BookVaksinViewModel>(
              builder: (context, book, child) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 160,
                    child: OutlinedButton(
                      onPressed: () {
                        // kondisi
                        if (book.isChecked == true) {
                          book.doubleCheckBook();
                        }

                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFF717971),
                        ),
                      ),
                      child: const Text(
                        'Periksa Kembali',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF006D39),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {
                        if (book.isChecked == true) {
                          book.doubleCheck = book.isChecked;
                        }

                        Navigator.pop(context);

                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(28),
                            ),
                          ),
                          context: context,
                          builder: (context) => const BookSuccess(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006D39),
                      ),
                      child: const Text(
                        'Book Vaksin',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
