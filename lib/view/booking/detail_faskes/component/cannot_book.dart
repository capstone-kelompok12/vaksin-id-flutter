import 'package:flutter/material.dart';

class CannotBook extends StatelessWidget {
  const CannotBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/Feeling sorry-cuate 2.png',
            width: 165,
          ),
          const Text(
            'Anda tidak dapat melakukan book vaksinasi kembali sebelum membatalkan book vaksinasi sebelumnya.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
