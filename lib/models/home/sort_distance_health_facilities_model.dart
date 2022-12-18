import 'package:vaksin_id_flutter/models/vaccine_model.dart';

import '../session_model.dart';

class SortDistanceHealthFacilities {
  String? fullname;
  String? nik;
  String? name;
  String? address;
  String? image;
  String? distance;
  double? latitude;
  double? longitude;
  int? distanceSort;
  List<Vaccine>? vaccine;
  List<Session>? session;

  SortDistanceHealthFacilities({
    this.fullname,
    this.nik,
    this.name,
    this.address,
    this.image,
    this.distance,
    this.latitude,
    this.longitude,
    this.distanceSort,
    this.vaccine,
    this.session,
  });

  SortDistanceHealthFacilities.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    nik = json['nik'];
    name = json['name'];
    address = json['address'];
    image = json['image'];
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distanceSort = json['distanceSort'];
    if (json['vaccine'] != null) {
      vaccine = <Vaccine>[];
      json['vaccine'].forEach((v) {
        vaccine!.add(Vaccine.fromJson(v));
      });
    }
    if (json['session'] != null) {
      session = <Session>[];
      json['session'].forEach((v) {
        session!.add(Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['nik'] = nik;
    data['name'] = name;
    data['address'] = address;
    data['image'] = image;
    data['distance'] = distance;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['distanceSort'] = distanceSort;
    if (vaccine != null) {
      data['vaccine'] = vaccine!.map((v) => v.toJson()).toList();
    }
    if (session != null) {
      data['session'] = session!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
