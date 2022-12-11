import 'dart:ui' as ui;
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vaksin_id_flutter/models/home/news_model.dart';
import 'package:vaksin_id_flutter/models/nearby_healt_facilities_model.dart';
import 'package:vaksin_id_flutter/models/vaccine_model.dart';
import 'package:vaksin_id_flutter/services/home/news_service.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';
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

  final newsService = NewsService();
  List<NewsModel> _news = [];
  List<NewsModel> get news => _news;

  MyState myState = MyState.loading;

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

  getAllNews() async {
    myState = MyState.loading;
    try {
      final getAllNews = await newsService.getAllNews();
      _news = getAllNews;
      myState = MyState.none;
      notifyListeners();
    } catch (e) {
      myState = MyState.error;
    }
  }
}
