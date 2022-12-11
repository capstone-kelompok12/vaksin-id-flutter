import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/home_view_model.dart';

import '../../../styles/theme.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, _) => 
      Container(
        width: MediaQuery.of(context).size.width,
        // value.haspermission ? 280 : 196
        height: value.sizeHeading,
        padding: const EdgeInsets.only(
          top: 41, bottom: 16, left: 16, right: 16),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 109, 57, 0.12)),
        child: value.apiState == ApiState.loading ?
          const Center(child: CircularProgressIndicator(),) :
          value.apiState == ApiState.none ?
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                width: double.infinity,
                height: 28,
                child: Text(
                  'Halo, ${value.listHealthFaci?.data!.user!.fullname}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 22
                  ),)),
            ),
            Padding(
              // value.haspermission ? 24 : 0
              padding: EdgeInsets.only(bottom: value.paddingBottomHeading),
              child: SizedBox(
                width: double.infinity,
                height: 87,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Vaksin dulu yuk!',
                              style: TextStyle(fontSize: 16)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kapan lagi book vaksinasi tanpa ribet.',
                              style: TextStyle(fontSize: 16),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 101,
                      height: double.infinity,
                      child: Image.asset('assets/amico.png'))
                  ],
                ),
              ),
            ),
            !value.haspermission ?
            Container(
              width: double.infinity,
              height: 60,
              padding: const EdgeInsets.only(left: 16, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: whiteColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Set Lokasi dulu, ya'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: whiteColor, 
                    ),
                    onPressed: () async {
                      // value.getNearbyHF();
                      await value.activateGps();
                      
                      if (value.haspermission) {
                        await value.getCurrentLocation();
                        print('GPS enabled');
                      }
                    }, 
                    child: Text(
                      'Izinkan',
                      style: TextStyle(color: whiteColor),)),
              ]),
            ) 
            : Container()
          ],
        ) : const Center(child: Text('Error Load Data'),)
      ),
    );
  }
}