import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/home/nearby_healt_facilities_model.dart';
import '../../../../styles/theme.dart';
import '../../../../view_model/booking/detail_faskes_view_model.dart';
import '../../../../view_model/home/home_view_model.dart';
import '../../../booking/detail_faskes/detail_faskes_screen.dart';

class HfInfoWindow extends StatelessWidget {
  const HfInfoWindow({super.key, required this.customInfoWindowController, required this.listHf, required this.x});

  final CustomInfoWindowController customInfoWindowController;
  final NearbyHealthFacilitiesModel listHf;
  final int x;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${listHf.data!.healthFacilities![x].name}',
                      textAlign: TextAlign.center,
                    )),
              ),
              Consumer<HomeViewModel>(
                builder: (context, value, _) => Material(
                  color: Colors.transparent,
                  child: Consumer<DetailFasKesViewModel>(
                    builder: (context, value2, _) => InkWell(
                      splashColor: primaryColor.withOpacity(0.3),
                      onTap: () {
                        value2.getDetailHealthFacilities(
                            value.locationListWithDistance,
                            value.locationListWithDistance[x]
                                .name!);
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                          builder: (context) =>
                              const DetailFasKesScreen(),
                        ));
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Triangle.isosceles(
          edge: Edge.BOTTOM,
          child: Container(
            color: Colors.white,
            width: 20.0,
            height: 10.0,
          ),
        ),
      ],
    );
  }
}