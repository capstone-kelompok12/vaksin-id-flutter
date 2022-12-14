import 'dart:ui' as ui;
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vaksin_id_flutter/models/home/nearby_healt_facilities_model.dart';
import 'package:vaksin_id_flutter/models/home/news_model.dart';
import 'package:vaksin_id_flutter/models/home/sort_distance_health_facilities.dart';
import 'package:vaksin_id_flutter/models/home/vaccine_model.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';
import '../services/home/home_service.dart';

// enum ApiState { none, loading, error}

class HomeViewModel extends ChangeNotifier {
  final healtFaci = HealthFaciApi();
  NearbyHealthFacilitiesModel? listHealthFaci;
  VaccineModel? listVaccine;
  List<NewsModel>? listNews;
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  Position? currentPosition;
  LatLng? currentLatLng;
  String? currentAddress;
  List<SortDistanceHealthFacilities> locationListWithDistance = [];
  double sizeHomeScreen = 865;
  double sizeHeading = 280;
  double paddingBottomHeading = 24;
  List<Marker> markers = [];
  MyState apiState = MyState.none;

  checkGps() async {
    apiState = MyState.loading;
    servicestatus = await Geolocator.isLocationServiceEnabled();
    await getVaccine();
    await getNews();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.denied) {
        haspermission = true;
        sizeHomeScreen = 1045;
        sizeHeading = 196;
        paddingBottomHeading = 0;
        await getCurrentLocation();
        await getNearbyHF();
        await addListHealthFaci();
        print("GPS Service enabled");
        apiState = MyState.none;
      }
    } else {
      haspermission = false;
      sizeHomeScreen = 865;
      sizeHeading = 280;
      paddingBottomHeading = 24;
      print("GPS Service is not enabled, turn on GPS location");
      apiState = MyState.none;
    }
    apiState = MyState.none;
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
      await getCurrentLocation();
      await getNearbyHF();
      await addListHealthFaci();
    }
    notifyListeners();
  }

  getNearbyHF() async {
    try {
      listHealthFaci = await healtFaci.getNearbyHealthFacilities(
          currentLatLng!.latitude, currentLatLng!.longitude);
    } catch (e) {
      apiState = MyState.error;
      rethrow;
    }
  }

  getVaccine() async {
    try {
      listVaccine = await healtFaci.getVaccine();
      if (listVaccine!.data!.isNotEmpty) {
        listVaccine?.data?.sort((a, b) => b.stock!.compareTo(a.stock!));
      }
    } catch (e) {
      apiState = MyState.error;
      rethrow;
    }
  }

  getNews() async {
    try {
      listNews = await healtFaci.getNewsVaccine();
    } catch (e) {
      apiState = MyState.error;
      rethrow;
    }
  }

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      currentPosition = position;
      currentLatLng = LatLng(position.latitude, position.longitude);
      notifyListeners();
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

  addListHealthFaci() async {
    locationListWithDistance.clear();
    for (var x = 0; x < listHealthFaci!.data!.healthFacilities!.length; x++) {
      // print(x);

      final distance = listHealthFaci!.data!.healthFacilities![x].ranges;

      if (distance! < 1) {
        final inMeters = distance * 1000;
        locationListWithDistance.add(
          SortDistanceHealthFacilities(
            nama: listHealthFaci!.data!.healthFacilities![x].name!,
            alamat: listHealthFaci!
                .data!.healthFacilities![x].address!.currentAddress!,
            jarak: '${inMeters.toStringAsFixed(2)} m',
            image: listHealthFaci!.data!.healthFacilities![x].image!,
            distanceSort: inMeters.toInt(),
            session: listHealthFaci!.data!.healthFacilities![x].session!,
            namaUser: listHealthFaci!.data!.user!.fullname!,
            nikUser: listHealthFaci!.data!.user!.nik,
          ),
        );
      } else {
        locationListWithDistance.add(
          SortDistanceHealthFacilities(
            nama: listHealthFaci!.data!.healthFacilities![x].name!,
            alamat: listHealthFaci!
                .data!.healthFacilities![x].address!.currentAddress!,
            jarak: '${distance.toStringAsFixed(2)} km',
            image: listHealthFaci!.data!.healthFacilities![x].image!,
            distanceSort: distance.toInt(),
            session: listHealthFaci!.data!.healthFacilities![x].session!,
            namaUser: listHealthFaci!.data!.user!.fullname!,
            nikUser: listHealthFaci!.data!.user!.nik,
          ),
        );
      }
    }
    notifyListeners();
  }

  launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
