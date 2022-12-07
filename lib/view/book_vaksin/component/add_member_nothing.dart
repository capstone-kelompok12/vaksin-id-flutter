import 'package:flutter/material.dart';

class AddMemberNothing extends StatelessWidget {
  const AddMemberNothing({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 180,
            child: Image.asset('assets/addMember.png'),
          ),
          const SizedBox(height: 14),
          const Text(
            'Silahkan cari penerima vaksin terlebih dahulu.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
