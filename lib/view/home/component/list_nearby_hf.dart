import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/home/nearby_hf_screen.dart';

import '../../../styles/theme.dart';
import '../../../view_model/home_view_model.dart';

class ListNearbyHfHomeScreen extends StatelessWidget {
  const ListNearbyHfHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, _) =>
      value.locationListWithDistance.isNotEmpty ?
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 264,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 28, bottom: 16, left: 16, right: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Fasilitas Kesehatan Terdekat',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      Transform.rotate(
                          angle: 110,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () => Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const NearbyHfScreen(),)
                              ),
                              child: const Icon(Icons.arrow_back_ios_new_rounded)),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: value.apiState == ApiState.loading ?
                    const Center(child: CircularProgressIndicator(),) :
                  value.apiState == ApiState.none ? 
                    ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                      itemCount: value.locationListWithDistance.length < 5 ?
                        value.locationListWithDistance.length : 5,
                      itemBuilder: (context, index) => SizedBox(
                        width: 215,
                        height: 180,
                        child: Card(
                          color: whiteColor,
                          child: InkWell(
                            onTap: () => print('gridTap'),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    height: 115,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                      child: Image.network(faker.image.image(
                                        keywords: ['hospital'],
                                        random: true),
                                        fit: BoxFit.fill),
                                    ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, bottom: 5, left: 8, right: 8),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      value.locationListWithDistance[index]['nama'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontWeight: FontWeight.w600),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 16, left: 8, right: 8),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(value.locationListWithDistance[index]['jarak'])),
                                )],
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Center(child: Text('Error Load Data'),)
                ),
              )],
          ),
        )
      : Container()
    );
  }
}