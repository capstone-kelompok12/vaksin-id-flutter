import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/detail_faskes/detail_faskes_screen.dart';
import 'package:vaksin_id_flutter/view_model/book_vaksin/detail_faskes_view_model.dart';

class HomeBoongan extends StatefulWidget {
  const HomeBoongan({super.key});

  @override
  State<HomeBoongan> createState() => _HomeBoonganState();
}

class _HomeBoonganState extends State<HomeBoongan> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var detailProvider =
          Provider.of<DetailFasKesViewModel>(context, listen: false);
      await detailProvider.getFaskes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Consumer<DetailFasKesViewModel>(
            builder: (context, detail, child) => ListView.builder(
              shrinkWrap: true,
              itemCount: detail.healthFacilities.length,
              itemBuilder: (context, index) => ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => DetailFasKesScreen(
                      //     id: detail.healthFacilities[index].iD)),
                      builder: (context) => DetailFasKesScreen(),
                    ),
                  );
                },
                child: Text('${detail.healthFacilities[index].name}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
