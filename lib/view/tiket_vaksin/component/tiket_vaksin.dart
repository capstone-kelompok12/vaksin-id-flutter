import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/widgets/tiket_vaksin_card.dart';

class TiketVaksin extends StatelessWidget {
  const TiketVaksin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TiketVaksinCard(
              vaksin: 'Sinovac',
              statusTiket: 'diterima',
            ),
          ],
        ),
      ),
    );
  }
}
