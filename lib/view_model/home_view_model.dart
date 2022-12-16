import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vaksin_id_flutter/models/home/nearby_healt_facilities_model.dart';
import 'package:vaksin_id_flutter/models/home/news_model.dart';
import 'package:vaksin_id_flutter/models/home/sort_distance_health_facilities_model.dart';
import 'package:vaksin_id_flutter/models/home/vaccine_model.dart';
import 'package:vaksin_id_flutter/view/component/finite_state.dart';
import 'package:vaksin_id_flutter/view_model/profile/profile_view_model.dart';
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
  ProfileViewModel profileViewModel = ProfileViewModel();

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
        if (listHealthFaci == null) {
          await getCurrentLocation();
          await getNearbyHF(currentLatLng!.latitude, currentLatLng!.longitude);
        }
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
      await getNearbyHF(currentLatLng!.latitude, currentLatLng!.longitude);
      await addListHealthFaci();
    }
    notifyListeners();
  }

  getNearbyHF(double lat, double long) async {
    try {
      listHealthFaci = await healtFaci.getNearbyHealthFacilities(lat, long);
      print('listHf: ${listHealthFaci?.data?.healthFacilities?.length}');
      await addListHealthFaci();
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
      print(currentLatLng);
      print(currentPosition);
    }).catchError((e) {
      print(e);
    });
  }

  addListHealthFaci() async {
    locationListWithDistance.clear();
    for (var x = 0; x < listHealthFaci!.data!.healthFacilities!.length; x++) {
      final distance = listHealthFaci!.data!.healthFacilities![x].ranges;

      if (distance! < 1) {
        final inMeters = distance * 1000;
        locationListWithDistance.add(
          SortDistanceHealthFacilities(
            fullname: listHealthFaci!.data!.user!.fullname,
            nik: listHealthFaci!.data!.user!.nIK!,
            name: listHealthFaci!.data!.healthFacilities![x].name!,
            address: listHealthFaci!
                .data!.healthFacilities![x].address!.currentAddress!,
            image: listHealthFaci!.data!.healthFacilities![x].image!,
            distance: '${inMeters.toStringAsFixed(2)} m',
            distanceSort: inMeters.toInt(),
            vaccine: listHealthFaci!.data!.healthFacilities![x].vaccine,
          ),
        );
      } else {
        locationListWithDistance.add(
          SortDistanceHealthFacilities(
            fullname: listHealthFaci!.data!.user!.fullname,
            nik: listHealthFaci!.data!.user!.nIK!,
            name: listHealthFaci!.data!.healthFacilities![x].name!,
            address: listHealthFaci!
                .data!.healthFacilities![x].address!.currentAddress!,
            image: listHealthFaci!.data!.healthFacilities![x].image!,
            distance: '${distance.toStringAsFixed(2)} km',
            distanceSort: distance.toInt(),
            vaccine: listHealthFaci!.data!.healthFacilities![x].vaccine,
          ),
        );
      }
    }
    notifyListeners();
    print('namaaaa: ${listHealthFaci!.data!.user!.fullname}');
  }

  launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
