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

import '../../view_model/home_view_model.dart';

class NearbyHfScreen extends StatefulWidget {
  const NearbyHfScreen({super.key});

  @override
  State<NearbyHfScreen> createState() => _NearbyHfScreenState();
}

class _NearbyHfScreenState extends State<NearbyHfScreen> {

  bool servicestatus = false;
  bool haspermission = false;
  Position? currentPosition;
  LatLng? currentLatLng;
  String? currentAddress;
  int selectedMarker = 0;
  Uint8List? markerIcon;
  Uint8List? markerIconSelected;
  late LocationPermission permission;
  List<Marker> markers = [];
  List<Map<String, dynamic>> locationListWithDistance = [];
  GoogleMapController? gmController;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    checkGps();
    super.initState();
  }

  @override
  void dispose() {
    markers.clear();
    locationListWithDistance.clear();
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

  checkGps() async {
    Provider.of<HomeViewModel>(context, listen: false).getHealthFacilities();
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        await getCurrentLocation();
        print('GPS enabled');
        await addMarkers();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }
  }

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        currentPosition = position;
        currentLatLng = LatLng(position.latitude, position.longitude);
        print(currentLatLng);
      });
      print(currentPosition);
    }).catchError((e) {
      print(e);
    });
    getAddressFromLatLng();
  }

  getAddressFromLatLng() async {
    try {
      final address =
          // await geoCode.reverseGeocoding(latitude:
          //     currentPosition!.latitude, longitude: currentPosition!.longitude);
          await placemarkFromCoordinates(
              currentPosition!.latitude, currentPosition!.longitude);

      print(address.first);

      setState(() {
        currentAddress = "${address.first.subAdministrativeArea}";
      });
      print(currentAddress);
    } catch (e) {
      print(e);
    }
  }

  addMarkers() async {
    final listHospital =
        Provider.of<HomeViewModel>(context, listen: false).listHealthFaci;
    markerIcon = await getBytesFromAsset('assets/hospital_loc_icon.png', 50);
    markerIconSelected =
        await getBytesFromAsset('assets/hospital_loc_icon.png', 80);

    for (var x = 0; x < listHospital!.data!.length; x++) {
      // print(x);
      double distance = calculateDistance(
          currentPosition!.latitude,
          currentPosition!.longitude,
          double.parse(listHospital.data![x].latitude!),
          double.parse(listHospital.data![x].longitude!));

      if (distance.toInt() < 1) {
        final inMeters = distance * 1000;
        locationListWithDistance.add({
          'nama': listHospital.data![x].nama,
          'alamat': listHospital.data![x].alamat,
          'distance': '${inMeters.toStringAsFixed(2)} m',
          'distanceSort': inMeters.toInt(),
        });
      } else {
        locationListWithDistance.add({
          'nama': listHospital.data![x].nama,
          'alamat': listHospital.data![x].alamat,
          'distance': '${distance.toStringAsFixed(2)} km',
          'distanceSort': distance.toInt(),
        });
      }
      markers.add(
        Marker(
          markerId: MarkerId('$x'),
          position: LatLng(double.parse(listHospital.data![x].latitude!),
              double.parse(listHospital.data![x].longitude!)),
          icon: BitmapDescriptor.fromBytes(markerIcon!),
          consumeTapEvents: true,
          visible: true,
          onTap: () {
            print('tapMarker1');
            if (selectedMarker != x) {
              print('selectedMarker1: $selectedMarker');
              setState(() {
                if (selectedMarker != 0) {
                  markers[selectedMarker] = markers[selectedMarker].copyWith(
                      iconParam: BitmapDescriptor.fromBytes(markerIcon!));
                }
                markers[x] = markers[x].copyWith(
                    iconParam: BitmapDescriptor.fromBytes(markerIconSelected!));
                selectedMarker = x;
              });
              gmController?.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(
                          double.parse(listHospital.data![x].latitude!),
                          double.parse(listHospital.data![x].longitude!)),
                      zoom: 13)));
              print('selectedMarker2: $selectedMarker');
              print('id: ${x}');
            }
            customInfoWindowController.addInfoWindow!(
              GestureDetector(
                onTap: () {
                  print('infoTap');
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${listHospital.data![x].nama}',
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                    Triangle.isosceles(
                      edge: Edge.BOTTOM,
                      child: Container(
                        color: Colors.blue,
                        width: 20.0,
                        height: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
              LatLng(double.parse(listHospital.data![x].latitude!),
                  double.parse(listHospital.data![x].longitude!)),
            );
          },
        ),
      );
    }

    locationListWithDistance.sort((a, b) {
      int d1 = a['distanceSort'];
      int d2 = b['distanceSort'];
      if (d1 > d2) {
        return 1;
      } else if (d1 < d2) {
        return -1;
      } else {
        return 0;
      }
    });
    locationListWithDistance.forEach((element) {
      print('hf:  ${element["nama"]} ${element["distance"]}');
    });
    print('markerFirstRandom: ${markers.first.position}');
    print('markerLastRandom: ${markers.last.position}');
    print('markerlength: ${markers.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                currentLatLng == null
                  ? const Center(child: CircularProgressIndicator())
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
                        target: currentLatLng ?? const LatLng(-6.200000, 106.816666),
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
                                target: currentLatLng!,
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
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              child: Consumer<HomeViewModel>(
                builder: (context, value, _) => ListView.builder(
                  // controller: scrollController,
                  itemCount: value.listHealthFaci?.data?.length,
                  itemBuilder: (context, index) {
                    return locationListWithDistance.isEmpty ? const Center(child: CircularProgressIndicator()) 
                    : Card(
                      elevation: 2,
                      // margin: EdgeInsets.all(),
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
                                        '${locationListWithDistance[index]['nama']}', 
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900, 
                                          fontSize: 14),),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4),
                                          child: Text(
                                            '${locationListWithDistance[index]['alamat']}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),),
                                        ),
                                      ),
                                      Text(
                                        '${locationListWithDistance[index]['distance']}', 
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
                      // ListTile(
                      //   onTap: () => print('listTap'),
                      //   leading: Container(
                      //     alignment: Alignment.center,
                      //     height: 70,
                      //     width: 70,
                      //     child: Image.network(faker.image.image(
                      //       width: 1200, height: 900, keywords: ['city'], random: true))),
                      //   title: Text('${locationListWithDistance[index]['nama']}'),
                      //   subtitle: Text(
                      //     maxLines: 2,
                      //     '${locationListWithDistance[index]['alamat']}'),

                      //   // trailing: Text('${locationListWithDistance[index]['distance']}'),
                      // ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}