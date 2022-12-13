import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/widgets/tiket_vaksin_card.dart';

class RiwayatVaksin extends StatelessWidget {
  const RiwayatVaksin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TiketVaksinCard(
              vaksin: 'Astra',
              statusTiket: 'menunggu',
            ),
            TiketVaksinCard(
              vaksin: 'Astra',
              statusTiket: 'diterima',
            ),
            TiketVaksinCard(
              vaksin: 'Astra',
              statusTiket: 'ditolak',
            ),
            TiketVaksinCard(
              vaksin: 'Astra',
              statusTiket: 'dibatalkan',
            ),
          ],
        ),
      ),
    );
  }
}
