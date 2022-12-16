import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/widgets/tiket_vaksin_card.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

class TiketVaksin extends StatelessWidget {
  const TiketVaksin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Consumer<TiketVaksinViewModel>(
            builder: (context, value, child) {
              final tiket = value.tiketVaksin.data;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: tiket!.history!.length,
                itemBuilder: (context, index) =>
                    tiket.history![index].status == 'OnProccess'
                        ? TiketVaksinCard(
                            //   vaksin:
                            //       history.history![index].booking!.session!.vaccine!.name!,
                            //   statusTiket: history.history![index].status!,
                            history: tiket.history![index],
                          )
                        : const SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }
}
