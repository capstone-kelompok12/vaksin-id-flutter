import 'package:flutter/material.dart';

class BookUnsuccess extends StatelessWidget {
  const BookUnsuccess({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
              height: 210,
              child: Image.asset('assets/success2.png'),
            ),
          ),
          const Text(
            '''Yah..
sepertinya Anda kalah cepat''',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            child: Text(
              'Mohon maaf, kapasitas book vaksinasi telah penuh atau penerima vaksinasi yang Anda tambahkan melebihi kapasitas.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),

          // button
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // kalau udah ada route
                // Navigator.of(context)
                //     .popUntil(ModalRoute.withName('/namaroute'));

                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D39),
              ),
              child: const Text(
                'Book vaksinasi lain',
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
    );
  }
}
