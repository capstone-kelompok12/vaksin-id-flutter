import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/widgets/tiket_vaksin_card.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

import 'empty_history.dart';

class RiwayatVaksin extends StatelessWidget {
  const RiwayatVaksin({super.key});

  final String onTabBar = 'riwayat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<TiketVaksinViewModel>(builder: (context, value, child) {
      final history = value.tiketVaksin.data;
      return history!.history!.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: history.history!.length,
              itemBuilder: (context, index) =>
                  history.history![index].status != 'OnProcess' &&
                          history.history![index].status != 'Accepted'
                      ? TiketVaksinCard(
                          history: history.history![index],
                          nama: history.fullname!,
                        )
                      : const SizedBox())
          : const EmptyHistory();
    }));
  }
}
