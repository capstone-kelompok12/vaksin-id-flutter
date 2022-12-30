import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../styles/theme.dart';
import '../../../../view_model/booking/detail_faskes_view_model.dart';
import '../../../../view_model/home/home_view_model.dart';
import '../../../booking/detail_faskes/detail_faskes_screen.dart';

class ListSortNearby extends StatelessWidget {
  const ListSortNearby({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, _) => value.locationListWithDistance.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView.builder(
                itemCount: value.listHealthFaci?.data?.healthFacilities?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.3),
                            blurRadius: 3,
                            offset:
                                const Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Consumer<DetailFasKesViewModel>(
                        builder: (context, value2, _) => InkWell(
                          onTap: () {
                            value2.getDetailHealthFacilities(
                                value.locationListWithDistance,
                                value.locationListWithDistance[index].name!);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DetailFasKesScreen(),
                            ));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, left: 8, top: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    value.locationListWithDistance[index].image!,
                                    width: 92,
                                    height: 92,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 95,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.locationListWithDistance[index].name!,
                                          style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 14),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 4),
                                            child: Text(
                                              value.locationListWithDistance[index].address!,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          value.locationListWithDistance[index].distance!,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}