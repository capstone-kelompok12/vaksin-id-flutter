import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin_view_model.dart';

class DoubleCheckBookWidget extends StatefulWidget {
  const DoubleCheckBookWidget({super.key});

  @override
  State<DoubleCheckBookWidget> createState() => _DoubleCheckBookWidgetState();
}

class _DoubleCheckBookWidgetState extends State<DoubleCheckBookWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // kalau ukuran buttom sheet sesuai tinggi isi
      height: 480,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
        color: Color(0xFFFBFDF7),
      ),
      child: Column(
        // kalau ukuran buttom sheet sesuai tinggi isi
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Icon(
              // iconnya drag handle nya ga nemu yg 1
              Icons.drag_handle_rounded,
              color: const Color(0xFF717971).withOpacity(0.4),
              size: 32,
            ),
          ),
          Container(
            height: 180,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(46),
              color: const Color(0xFFE7EFF6),
            ),

            // sementara
            child: Icon(
              Icons.check_box_outlined,
              size: 150,
              color: Colors.blueAccent.withOpacity(0.50),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Mohon periksa data anda',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            child: Text(
              'Anda hanya dapat membooking 1 vaksin dalam 1 waktu. Anda harus membatalkannya terlebih dahulu jika ingin membooking kembali.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
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
            // kalau ukuran buttom sheet sesuai tinggi isi
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 160,
                  child: OutlinedButton(
                    onPressed: () {
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
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF006D39),
                      side: const BorderSide(
                        color: Color(0xFF717971),
                      ),
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
          )
        ],
      ),
    );
  }
}
