import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';

class CancelBook extends StatelessWidget {
  const CancelBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: const Color(0xFFD3D3D3),
              height: 4,
              width: 32,
            ),
          ),
          Image.asset(
            'assets/cancel_book_image.png',
            width: 250,
            height: 250,
          ),
          Text(
            'Ups..\nSepertinya akun Anda telah terdaftar',
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
            'Anda hanya dapat mendaftarkan satu NIK untuk satu akun.',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24.0,
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
                      'Ya, Batalkan',
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