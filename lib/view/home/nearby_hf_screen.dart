import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view/home/component/nearby_screen/custom_info_window.dart';
import 'package:vaksin_id_flutter/view/home/component/nearby_screen/header.dart';
import 'package:vaksin_id_flutter/view/home/component/nearby_screen/list_sort_nearby.dart';
import 'package:vaksin_id_flutter/view/home/null_location.dart';

import '../../view_model/home/home_view_model.dart';

class NearbyHfScreen extends StatefulWidget {
  const NearbyHfScreen({super.key});

  @override
  State<NearbyHfScreen> createState() => _NearbyHfScreenState();
}

class _NearbyHfScreenState extends State<NearbyHfScreen> {
  int selectedMarker = 0;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  Uint8List? markerIcon;
  Uint8List? markerIconSelected;
  List<Marker> markers = [];

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  @override
  void dispose() {
    markers.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<HomeViewModel>(context, listen: false)
            .gmController
            ?.dispose();
      }
    });
    customInfoWindowController.dispose();
    print('Dispose used');
    super.dispose();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  addMarkers() async {
    final listHf =
        Provider.of<HomeViewModel>(context, listen: false).listHealthFaci;
    final gmControl = Provider.of<HomeViewModel>(context, listen: false);
    markerIcon = await getBytesFromAsset('assets/hospital_loc_icon.png', 50);
    markerIconSelected =
        await getBytesFromAsset('assets/hospital_loc_icon.png', 80);

    if (listHf != null) {
      for (var x = 0; x < listHf.data!.healthFacilities!.length; x++) {
        // print(x);
        setState(() {
          markers.add(
            Marker(
              markerId: MarkerId('$x'),
              position: LatLng(
                  double.parse(
                      '${listHf.data!.healthFacilities![x].address!.latitude!}'),
                  double.parse(
                      '${listHf.data!.healthFacilities![x].address!.longitude!}')),
              icon: BitmapDescriptor.fromBytes(markerIcon!),
              consumeTapEvents: true,
              visible: true,
              onTap: () {
                print('selectedMarker');
                if (selectedMarker != -1) {
                  print('selectedMarker1: $selectedMarker');
                  setState(() {
                    if (selectedMarker != -1) {
                      print('selectedMarkerid: $x');
                      markers[selectedMarker] = markers[selectedMarker]
                          .copyWith(
                              iconParam:
                                  BitmapDescriptor.fromBytes(markerIcon!));
                    }
                    markers[x] = markers[x].copyWith(
                        iconParam:
                            BitmapDescriptor.fromBytes(markerIconSelected!));
                    selectedMarker = x;
                  });
                  print('selectedMarker2: $selectedMarker');
                }
                gmControl.animateGmController(
                    LatLng(
                        double.parse(
                                '${listHf.data!.healthFacilities![x].address!.latitude!}') +
                            0.007216,
                        double.parse(
                            '${listHf.data!.healthFacilities![x].address!.longitude!}')),
                    13);
                customInfoWindowController.addInfoWindow!(
                  HfInfoWindow(
                      customInfoWindowController: customInfoWindowController,
                      listHf: listHf,
                      x: x),
                  LatLng(
                      double.parse(
                          '${listHf.data!.healthFacilities![x].address!.latitude!}'),
                      double.parse(
                          '${listHf.data!.healthFacilities![x].address!.longitude!}')),
                );
              },
            ),
          );
        });
      }
      print('markerFirstRandom: ${markers.first.position}');
      print('markerLastRandom: ${markers.last.position}');
      print('markerlength: ${markers.length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, value, _) => value.haspermission
            ? Scaffold(
                appBar: AppBar(
                  title: const Text('Fasilitas Kesehatan Terdekat'),
                  automaticallyImplyLeading: false,
                ),
                body: Column(
                  children: [
                    HeaderGoogleMaps(
                        markers: markers,
                        customInfoWindowController: customInfoWindowController,
                        selectedMarker: selectedMarker,
                        markerIcon: markerIcon),
                    const Expanded(child: ListSortNearby()),
                  ],
                ))
            : const NullLocation());
  }
}
