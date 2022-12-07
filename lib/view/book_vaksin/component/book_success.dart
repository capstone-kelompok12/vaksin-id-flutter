import 'package:flutter/material.dart';

class BookSuccess extends StatelessWidget {
  const BookSuccess({super.key});

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
              height: 208,
              child: Image.asset('assets/success.png'),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            '''Yeay!
Book vaksinasi berhasil''',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            child: Text(
              'Siapkan diri Anda untuk mendapatkan vaksinasi sesuai waktu dan lokasi yang telah dipilih, ya.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),

          // button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 160,
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigator.push ke halaman home
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFF717971),
                      ),
                    ),
                    child: const Text(
                      'Beranda',
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
                      // Navigator.push ke halaman history
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006D39),
                    ),
                    child: const Text(
                      'Lihat Tiket',
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
        ],
      ),
    );
  }
}
