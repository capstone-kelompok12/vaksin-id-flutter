import 'package:flutter/material.dart';

class EmptyBook extends StatelessWidget {
  const EmptyBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'assets/Halloween-tickets-cuate-1.png',
              height: 200, width: 200,),
          ),
          const Text('Book vaksinasi dulu yuk!')
        ],
      ),
    );
  }
}