import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/component/empty_booking.dart';
import 'package:vaksin_id_flutter/view/tiket_vaksin/widgets/tiket_vaksin_card.dart';
import 'package:vaksin_id_flutter/view_model/tiket_vaksin/tiket_vaksin_view_model.dart';

import '../../../models/tiket_vaksin/tiket_vaksin_model.dart';

class TiketVaksin extends StatefulWidget {
  const TiketVaksin({super.key});

  @override
  State<TiketVaksin> createState() => _TiketVaksinState();
}

class _TiketVaksinState extends State<TiketVaksin> {
  final String onTabBar = 'tiket';

  bool? checkBook;

  checkBooking(Data? tiket) {
    final history = tiket!.history!.firstWhere(
      (e) => e.booking!.status == 'OnProcess',
      orElse: () => History(),
    );
    print('historyStatus: ${history.status}');
    checkBook = history.status?.isNotEmpty;
    print(checkBook);
  }

  @override
  void initState() {
    final tiket = Provider.of<TiketVaksinViewModel>(context, listen: false)
        .tiketVaksin
        .data;
    checkBooking(tiket);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Consumer<TiketVaksinViewModel>(
          builder: (context, value, child) {
            final tiket = value.tiketVaksin.data;
            return checkBook == true
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: tiket!.history!.length,
                    itemBuilder: (context, index) =>
                        tiket.history![index].status == 'OnProcess'
                            ? TiketVaksinCard(
                                history: tiket.history![index],
                                nama: tiket.fullname!,
                              )
                            : const SizedBox(),
                  )
                : const EmptyBook();
          },
        ),
      ),
    );
  }
}
