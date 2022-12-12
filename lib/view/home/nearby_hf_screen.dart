import 'dart:math';
import 'dart:ui' as ui;
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:faker/faker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/styles/theme.dart';
import 'package:vaksin_id_flutter/view/home/null_location.dart';

import '../../view_model/home_view_model.dart';

class NearbyHfScreen extends StatefulWidget {
  const NearbyHfScreen({super.key});

  @override
  State<NearbyHfScreen> createState() => _NearbyHfScreenState();
}

class _NearbyHfScreenState extends State<NearbyHfScreen> {

  // bool servicestatus = false;
  // bool haspermission = false;
  // Position? currentPosition;
  // LatLng? currentLatLng;
  // String? currentAddress;
  // late LocationPermission permission;
  // List<Map<String, dynamic>> locationListWithDistance = [];
  int selectedMarker = 0;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  Uint8List? markerIcon;
  Uint8List? markerIconSelected;
  List<Marker> markers = [];
  GoogleMapController? gmController;

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  @override
  void dispose() {
    markers.clear();
    gmController?.dispose();
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
    final listHf = Provider.of<HomeViewModel>(context, listen: false).listHealthFaci;
    // final loclistHf = Provider.of<HomeViewModel>(context, listen: false).locationListWithDistance;
    markerIcon = await getBytesFromAsset('assets/hospital_loc_icon.png', 50);
    markerIconSelected = await getBytesFromAsset('assets/hospital_loc_icon.png', 80);

    if (listHf != null) {
      for (var x = 0; x < listHf.data!.healthFacilities!.length; x++) {
        // print(x);
        setState(() {
          markers.add(
            Marker(
              markerId: MarkerId('$x'),
              position: LatLng(
                listHf.data!.healthFacilities![x].address!.latitude!,
                listHf.data!.healthFacilities![x].address!.longitude!),
              icon: BitmapDescriptor.fromBytes(markerIcon!),
              consumeTapEvents: true,
              visible: true,
              onTap: () {
                print('selectedMarker');
                if (selectedMarker != -1) {
                  print('selectedMarker1: $selectedMarker');
                  setState(() {
                    if (selectedMarker != -1) {
                      print('selectedMarkerid: ${x}');
                      markers[selectedMarker] = markers[selectedMarker].copyWith(
                          iconParam: BitmapDescriptor.fromBytes(markerIcon!));
                    }
                    markers[x] = markers[x].copyWith(
                        iconParam: BitmapDescriptor.fromBytes(markerIconSelected!));
                    selectedMarker = x;
                  });
                  print('selectedMarker2: $selectedMarker');
                }
                gmController?.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(
                            listHf.data!.healthFacilities![x].address!.latitude! + 0.007216,
                            listHf.data!.healthFacilities![x].address!.longitude!),
                        zoom: 13)));
                customInfoWindowController.addInfoWindow!(
                  Column(
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
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: primaryColor.withOpacity(0.3),
                                onTap: () => print('infoTap'),
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
                  ),
                  LatLng(listHf.data!.healthFacilities![x].address!.latitude!,
                      listHf.data!.healthFacilities![x].address!.longitude!),
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
      builder: (context, value, _) =>
      value.haspermission ?
      Scaffold(
        appBar: AppBar(
          title: const Text('Fasilitas Kesehatan Terdekat'),
        ),
        body:Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 209,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  markers.isEmpty ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                      mapType: MapType.normal,
                      markers: Set<Marker>.of(markers),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      onCameraMove: (position) {
                        customInfoWindowController.onCameraMove!();
                      },
                      onTap: (argument) {
                        customInfoWindowController.hideInfoWindow!();
                        if (selectedMarker != 0) {
                          setState(() {
                            markers[selectedMarker] =
                                markers[selectedMarker].copyWith(
                                    iconParam: BitmapDescriptor.fromBytes(markerIcon!));
                            selectedMarker = 0;
                          });
                        }
                      },
                      initialCameraPosition: CameraPosition(
                        target: value.currentLatLng ?? const LatLng(-6.200000, 106.816666),
                        zoom: 11.5,
                      ),
                      onMapCreated: (controller) {
                        customInfoWindowController.googleMapController = controller;
                        gmController = controller;
                      },
                    ),
                  CustomInfoWindow(
                    controller: customInfoWindowController,
                    height: 75,
                    width: 150,
                    offset: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue
                          ),
                          child: IconButton(
                            onPressed: () {
                              gmController?.animateCamera(CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: value.currentLatLng!,
                                  zoom: 11.5)));
                            }, 
                            icon: const Icon(Icons.location_searching_sharp, color: Colors.white,)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Consumer<HomeViewModel>(
                builder: (context, value, _) => 
                value.locationListWithDistance.isEmpty ? const Center(child: CircularProgressIndicator()) 
                : Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: ListView.builder(
                    itemCount: value.listHealthFaci?.data?.healthFacilities?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () => print('listTap'),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8, left: 8, top: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(faker.image.image(
                                    width: 92, height: 92, keywords: ['city'], random: true)),
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
                                          '${value.locationListWithDistance[index]['nama']}', 
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w900, 
                                            fontSize: 14),),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 4),
                                            child: Text(
                                              '${value.locationListWithDistance[index]['alamat']}',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),),
                                          ),
                                        ),
                                        Text(
                                          '${value.locationListWithDistance[index]['jarak']}', 
                                          style: TextStyle(
                                            color: primaryColor, fontWeight: FontWeight.w600, fontSize: 12),)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        )
      ) : const NullLocation()
    );
  }
}