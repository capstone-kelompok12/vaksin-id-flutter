import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/home/list_vaccine_screen.dart';
import 'package:vaksin_id_flutter/view_model/home/home_view_model.dart';

import '../../../../styles/theme.dart';
import '../../../component/finite_state.dart';

class VaccineListHomeScreen extends StatelessWidget {
  const VaccineListHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: 260,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Daftar Vaksin di Indonesia',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  Transform.rotate(
                      angle: 110,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ListVaccineScreen(),
                                )),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 20,
                            )),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 176,
            child: Consumer<HomeViewModel>(
              builder: (context, value, _) => value.apiState == MyState.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : value.apiState == MyState.none
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 1),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 16,
                          ),
                          itemCount: value.listVaccine!.data!.length < 5
                              ? value.listVaccine!.data!.length
                              : 5,
                          itemBuilder: (context, index) => Container(
                            width: 115,
                            height: 176,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor.withOpacity(0.3),
                                  blurRadius: 3,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    height: 115,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 35, vertical: 20),
                                      child: Image.asset('assets/${value.listVaccine?.data?[index].name}.png'),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5, left: 8, right: 8),
                                  child: Text(
                                    value.listVaccine!.data![index].name ?? '',
                                    style: blackTextStyle.copyWith(
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${value.listVaccine!.data![index].stock} dosis',
                                  style: blackTextStyle.copyWith(),
                                )
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('Error Load Data'),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
