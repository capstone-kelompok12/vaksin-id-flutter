import 'package:flutter/material.dart';

class AddMemberNoResult extends StatelessWidget {
  const AddMemberNoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          child: Image.asset('assets/addMember2.png'),
        ),
        const SizedBox(height: 14),
        const Text(
          'Ups..',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Text(
          'Kami tidak dapat menemukan penerima vaksin tersebut. Pastikan setiap penerima vaksin telah daftar terlebih dahulu, ya.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
