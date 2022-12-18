import 'package:vaksin_id_flutter/models/vaccine_model.dart';

class NearbyHealthFacilitiesModel {
  Data? data;
  bool? error;
  String? message;

  NearbyHealthFacilitiesModel({this.data, this.error, this.message});

  NearbyHealthFacilitiesModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}

class Data {
  User? user;
  List<HealthFacilities>? healthFacilities;

  Data({this.user, this.healthFacilities});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    if (json['HealthFacilities'] != null) {
      healthFacilities = <HealthFacilities>[];
      json['HealthFacilities'].forEach((v) {
        healthFacilities!.add(HealthFacilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['User'] = user!.toJson();
    }
    if (healthFacilities != null) {
      data['HealthFacilities'] =
          healthFacilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? nIK;
  String? email;
  String? fullname;
  String? phoneNum;
  String? gender;
  int? vaccineCount;
  String? birthDate;
  int? age;
  Address? address;

  User(
      {this.nIK,
      this.email,
      this.fullname,
      this.phoneNum,
      this.gender,
      this.vaccineCount,
      this.birthDate,
      this.age,
      this.address});

  User.fromJson(Map<String, dynamic> json) {
    nIK = json['NIK'];
    email = json['Email'];
    fullname = json['Fullname'];
    phoneNum = json['PhoneNum'];
    gender = json['Gender'];
    vaccineCount = json['VaccineCount'];
    birthDate = json['BirthDate'];
    age = json['Age'];
    address =
        json['Address'] != null ? Address.fromJson(json['Address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NIK'] = nIK;
    data['Email'] = email;
    data['Fullname'] = fullname;
    data['PhoneNum'] = phoneNum;
    data['Gender'] = gender;
    data['VaccineCount'] = vaccineCount;
    data['BirthDate'] = birthDate;
    data['Age'] = age;
    if (address != null) {
      data['Address'] = address!.toJson();
    }
    return data;
  }
}

class Address {
  String? iD;
  String? idHealthFacilities;
  String? nikUser;
  String? currentAddress;
  String? district;
  String? city;
  String? province;
  int? latitude;
  int? longitude;

  Address({
    this.iD,
    this.idHealthFacilities,
    this.nikUser,
    this.currentAddress,
    this.district,
    this.city,
    this.province,
    this.latitude,
    this.longitude,
  });

  Address.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idHealthFacilities = json['IdHealthFacilities'];
    nikUser = json['NikUser'];
    currentAddress = json['CurrentAddress'];
    district = json['District'];
    city = json['City'];
    province = json['Province'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdHealthFacilities'] = idHealthFacilities;
    data['NikUser'] = nikUser;
    data['CurrentAddress'] = currentAddress;
    data['District'] = district;
    data['City'] = city;
    data['Province'] = province;
    data['Latitude'] = latitude;
    data['Longitude'] = longitude;
    return data;
  }
}

class HealthFacilities {
  String? iD;
  String? email;
  String? phoneNum;
  String? name;
  String? image;
  double? ranges;
  AddressNF? address;
  List<Vaccine>? vaccine;

  HealthFacilities(
      {this.iD,
      this.email,
      this.phoneNum,
      this.name,
      this.image,
      this.ranges,
      this.address,
      this.vaccine});

  HealthFacilities.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    email = json['Email'];
    phoneNum = json['PhoneNum'];
    name = json['Name'];
    image = json['Image'];
    ranges = json['Ranges'];
    address =
        json['Address'] != null ? AddressNF.fromJson(json['Address']) : null;
    if (json['Vaccine'] != null) {
      vaccine = <Vaccine>[];
      json['Vaccine'].forEach((v) {
        vaccine!.add(Vaccine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Email'] = email;
    data['PhoneNum'] = phoneNum;
    data['Name'] = name;
    data['Image'] = image;
    data['Ranges'] = ranges;
    if (address != null) {
      data['Address'] = address!.toJson();
    }
    if (vaccine != null) {
      data['Vaccine'] = vaccine!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressNF {
  String? iD;
  String? idHealthFacilities;
  String? nikUser;
  String? currentAddress;
  String? district;
  String? city;
  String? province;
  double? latitude;
  double? longitude;

  AddressNF({
    this.iD,
    this.idHealthFacilities,
    this.nikUser,
    this.currentAddress,
    this.district,
    this.city,
    this.province,
    this.latitude,
    this.longitude,
  });

  AddressNF.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idHealthFacilities = json['IdHealthFacilities'];
    nikUser = json['NikUser'];
    currentAddress = json['CurrentAddress'];
    district = json['District'];
    city = json['City'];
    province = json['Province'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdHealthFacilities'] = idHealthFacilities;
    data['NikUser'] = nikUser;
    data['CurrentAddress'] = currentAddress;
    data['District'] = district;
    data['City'] = city;
    data['Province'] = province;
    data['Latitude'] = latitude;
    data['Longitude'] = longitude;
    return data;
  }
}
