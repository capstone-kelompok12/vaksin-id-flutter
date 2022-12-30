import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view_model/home/home_view_model.dart';

class ListVaccineScreen extends StatelessWidget {
  const ListVaccineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Vaksin di Indonesia'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) => GridView.builder(
            itemCount: value.listVaccine?.data!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.3),
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 156,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 20),
                          child: Image.asset('assets/${value.listVaccine?.data?[index].name}.png'),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 5, left: 8, right: 8),
                      child: Text(value.listVaccine?.data![index].name ?? ''),
                    ),
                    Text('${value.listVaccine?.data![index].stock}')
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
