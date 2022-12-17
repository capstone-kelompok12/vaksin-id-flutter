import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/widgets/tiket_vaksin_card.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

class RiwayatVaksin extends StatelessWidget {
  const RiwayatVaksin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Consumer<TiketVaksinViewModel>(
            builder: (context, value, child) {
              final history = value.tiketVaksin.data;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: history!.history!.length,
                  itemBuilder: (context, index) =>
                      history.history![index].status != 'OnProcess' &&
                              history.history![index].status != 'Accepted'
                          ? TiketVaksinCard(
                              history: history.history![index],
                              nama: history.fullname!,
                            )
                          : const SizedBox());
            },
          ),
        ),
      ),
    );
  }
}
