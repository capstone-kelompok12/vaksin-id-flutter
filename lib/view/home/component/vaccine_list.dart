import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/home/list_vaccine_screen.dart';
import 'package:vaksin_id_flutter/view_model/home_view_model.dart';

import '../../../styles/theme.dart';
import '../../component/finite_state.dart';

class VaccineListHomeScreen extends StatelessWidget {
  const VaccineListHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 28, bottom: 16,
              left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daftar Vaksin di Indonesia',
                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700)),
                  Transform.rotate(
                    angle: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const ListVaccineScreen(),)
                        ),
                        child: const Icon(Icons.arrow_back_ios_new_rounded)),
                    ))
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 176,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<HomeViewModel>(
                builder: (context, value, _) =>
                value.apiState == MyState.loading ?
                  const Center(child: CircularProgressIndicator(),) :
                value.apiState == MyState.none ? 
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: 8,), 
                    itemCount: value.listVaccine!.data!.length < 5 ?
                      value.listVaccine!.data!.length : 5,
                    itemBuilder: (context, index) => SizedBox(
                      width: 115,
                      height: 176,
                      child: Card(
                        color: whiteColor,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 115,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                                child: Image.asset('assets/vaksin.png'),
                              )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5, left: 8, right: 8),
                              child: Text(
                                value.listVaccine!.data![index].name ?? '',
                                style: const TextStyle(fontWeight: FontWeight.w600),),
                            ),
                            Text('${value.listVaccine!.data![index].stock}')
                          ],
                        ),
                      ),
                    ),) 
                : const Center(child: Text('Error Load Data'),),
              )
            ),
          ),
        ],
      ),
    );
  }
}