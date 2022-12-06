import 'package:flutter/material.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';

class ListVaccineScreen extends StatelessWidget {
  const ListVaccineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Vaksin di Indonesia'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12, horizontal: 16),
        child: GridView.builder(
          itemCount: 9,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8
          ), 
          itemBuilder: (context, index) {
            return Card(
              color: whiteColor,
              child: InkWell(
                onTap: () => print('gridTap'),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 156,
                      child: Image.asset('assets/vaksin.png')),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5, left: 8, right: 8),
                      child: Text('TestVaksin'),
                    ),
                    const Text('Dosis')
                  ],
                ),
              ),
            );
          },),
      ),
    );
  }
}