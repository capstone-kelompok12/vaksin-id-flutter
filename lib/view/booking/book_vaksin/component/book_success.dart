import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/component/bottom_navigation_bar_screen.dart';
import 'package:vaksin_id_flutter/view/home/home_screen.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/tiket_vaksin_screen.dart';
import 'package:vaksin_id_flutter/view_model/bottom_navigation/bottomnav_view_model.dart';

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
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: Container(
              height: 4,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF717971).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 160,
                  child: Consumer<BottomnavViewModel>(
                    builder: (context, value, child) =>
                    OutlinedButton(
                      onPressed: () {
                        // Navigator.push ke halaman home
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavigationBarScreen(setIndex: 0),
                          ),
                        );
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
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 160,
                  child: Consumer<BottomnavViewModel>(
                    builder: (context, value, child) =>
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push ke halaman history
                        WidgetsBinding.instance.addPostFrameCallback((_){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavigationBarScreen(setIndex: 2),
                            ),
                          );
                        });
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
