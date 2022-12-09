import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/home_model.dart';
import '../services/home_service.dart';

class HomeViewModel extends ChangeNotifier {
  final healtFaci = HealthFaciApi();
  HealthFacilities? listHealthFaci;
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  Position? currentPosition;
  LatLng? currentLatLng;
  String? currentAddress;
  List<Map<String, dynamic>> locationListWithDistance = [];


  getHealthFacilities() async {
    try {
      listHealthFaci = await healtFaci.getListHealthFaci();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  activateGps() async {
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
    } else {
      haspermission = false;
      print("GPS Service is not enabled, turn on GPS location");
    }
    notifyListeners();
  }

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      // setState(() {
        currentPosition = position;
        currentLatLng = LatLng(position.latitude, position.longitude);
        print(currentLatLng);
      // });
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
}
