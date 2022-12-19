import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/component/empty_booking.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/widgets/tiket_vaksin_card.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

class TiketVaksin extends StatelessWidget {
  const TiketVaksin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Consumer<TiketVaksinViewModel>(
          builder: (context, value, child) {
            final tiket = value.tiketVaksin.data;
            return value.checkBook == true
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: tiket!.history!.length,
                    itemBuilder: (context, index) {
                    // value.checkBookDate(tiket.history![index]);
                    return tiket.history![index].booking?.status == 'OnProcess' 
                      ? TiketVaksinCard(
                        history: tiket.history![index],
                        nama: tiket.fullname!,
                      ) : const SizedBox();
                    }
                  )
                : const EmptyBook();
          },
        ),
      ),
    );
  }
}
