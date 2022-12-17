import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';

class CancelBook extends StatelessWidget {
  const CancelBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/cancel_book_image.png',
            width: 250,
            height: 250,
          ),
          Text(
            'Apakah Anda yakin\ningin membatalkan book?',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            'Jika book dibatalkan, maka tiket akan hangus.',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16.0,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      side: BorderSide(color: primaryColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Kembali'),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      side: BorderSide(color: redColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Ya, batalkan',
                      style: redTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
