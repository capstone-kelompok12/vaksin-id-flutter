import 'dart:ui' as ui;
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vaksin_id_flutter/models/nearby_healt_facilities_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';
import '../services/home_service.dart';

enum ApiState { none, loading, error}

class HomeViewModel extends ChangeNotifier {
  final healtFaci = HealthFaciApi();
  // HealthFacilities? listHealthFaci;
  NearbyHealthFacilitiesModel? listHealthFaci;
  VaccineModel? listVaccine;
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  Position? currentPosition;
  LatLng? currentLatLng;
  String? currentAddress;
  List<Map<String, dynamic>> locationListWithDistance = [];
  double sizeHomeScreen = 865;
  double sizeHeading = 280;
  double paddingBottomHeading = 24;
  int selectedMarker = 0;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  Uint8List? markerIcon;
  Uint8List? markerIconSelected;
  List<Marker> markers = [];
  GoogleMapController? gmController;
  ApiState apiState = ApiState.none;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // getHealthFacilities() async {
  //   try {
  //     listHealthFaci = await healtFaci.getListHealthFaci();
  //   } catch (e) {
  //     rethrow;
  //   }
  //   notifyListeners();
  // }

  checkGps() async {
    apiState = ApiState.loading;
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.denied) {
        haspermission = true;
        sizeHomeScreen = 1045;
        sizeHeading = 196;
        paddingBottomHeading = 0;
        locationListWithDistance.add({'a': 1});
        await getCurrentLocation();
        await getNearbyHF();
        await getVaccine();
        print("GPS Service enabled");
        apiState = ApiState.none;
      } 
    } else {
      haspermission = false;
      sizeHomeScreen = 865;
      sizeHeading = 280;
      paddingBottomHeading = 24;
      print("GPS Service is not enabled, turn on GPS location");
      apiState = ApiState.none;
    }
    notifyListeners();
  }

  activateGps() async {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permissions are denied');
    } else if (permission == LocationPermission.deniedForever) {
      print("'Location permissions are permanently denied");
    } else {
      haspermission = true;
      sizeHomeScreen = 1045;
      sizeHeading = 196;
      paddingBottomHeading = 0;
      locationListWithDistance.add({'a': 1});
    }
    notifyListeners();
  }

  getNearbyHF() async {
    try {
      listHealthFaci = await healtFaci.getNearbyHealthFacilities();
    } catch (e) {
      apiState = ApiState.error;
      rethrow;
    }
  }

  getVaccine() async {
    try {
      listVaccine = await healtFaci.getVaccine();
    } catch (e) {
      apiState = ApiState.error;
      rethrow;
    }
  }

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
        currentPosition = position;
        currentLatLng = LatLng(position.latitude, position.longitude);
        print(currentLatLng);
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

      // setState(() {
        currentAddress = "${address.first.subAdministrativeArea}";
      // });
      print(currentAddress);
    } catch (e) {
      print(e);
    }
  }

  addMarkers() async {
    // final listHospital = Provider.of<HomeViewModel>(context, listen: false).listHealthFaci;
    markerIcon = await getBytesFromAsset('assets/hospital_loc_icon.png', 50);
    markerIconSelected = await getBytesFromAsset('assets/hospital_loc_icon.png', 80);

    for (var x = 0; x < listHealthFaci!.data!.healthFacilities!.length; x++) {
      // print(x);

      final distance = listHealthFaci!.data!.healthFacilities![x].ranges;

      if (distance! < 1) {
        final inMeters = distance * 1000;
        locationListWithDistance.add({
          'nama': listHealthFaci?.data!.healthFacilities![x].name,
          'alamat': listHealthFaci?.data!.healthFacilities![x].address!.currentAddress,
          'distance': '${inMeters.toStringAsFixed(2)} m',
          'distanceSort': inMeters.toInt(),
        });
      } else {
        locationListWithDistance.add({
          'nama': listHealthFaci?.data!.healthFacilities![x].name,
          'alamat': listHealthFaci?.data!.healthFacilities![x].address!.currentAddress,
          'distance': '${distance.toStringAsFixed(2)} km',
          'distanceSort': distance.toInt(),
        });
      }
      markers.add(
        Marker(
          markerId: MarkerId('$x'),
          position: LatLng(
            listHealthFaci!.data!.healthFacilities![x].address!.latitude!,
            listHealthFaci!.data!.healthFacilities![x].address!.longitude!),
          icon: BitmapDescriptor.fromBytes(markerIcon!),
          consumeTapEvents: true,
          visible: true,
          onTap: () {
            print('tapMarker1');
            if (selectedMarker != x) {
              print('selectedMarker1: $selectedMarker');

                if (selectedMarker != 0) {
                  markers[selectedMarker] = markers[selectedMarker].copyWith(
                      iconParam: BitmapDescriptor.fromBytes(markerIcon!));
                }
                markers[x] = markers[x].copyWith(
                    iconParam: BitmapDescriptor.fromBytes(markerIconSelected!));
                selectedMarker = x;

              gmController?.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(
                          listHealthFaci!.data!.healthFacilities![x].address!.latitude!,
                          listHealthFaci!.data!.healthFacilities![x].address!.longitude!),
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
                              '${listHealthFaci?.data!.healthFacilities![x].name}',
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
              LatLng(
                listHealthFaci!.data!.healthFacilities![x].address!.latitude!,
                listHealthFaci!.data!.healthFacilities![x].address!.longitude!),
            );
          },
        ),
      );
    }

    // locationListWithDistance.sort((a, b) {
    //   int d1 = a['distanceSort'];
    //   int d2 = b['distanceSort'];
    //   if (d1 > d2) {
    //     return 1;
    //   } else if (d1 < d2) {
    //     return -1;
    //   } else {
    //     return 0;
    //   }
    // });
    // locationListWithDistance.forEach((element) {
    //   print('hf:  ${element["nama"]} ${element["distance"]}');
    // });
    print('markerFirstRandom: ${markers.first.position}');
    print('markerLastRandom: ${markers.last.position}');
    print('markerlength: ${markers.length}');
  }
}
