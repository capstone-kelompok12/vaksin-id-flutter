import 'package:vaksin_id_flutter/models/session_model.dart';

class TiketVaksinModel {
  Data? data;
  bool? error;
  String? message;

  TiketVaksinModel({this.data, this.error, this.message});

  TiketVaksinModel.fromJson(Map<String, dynamic> json) {
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
  String? nIK;
  String? email;
  String? fullname;
  String? phoneNum;
  String? gender;
  int? vaccineCount;
  String? birthDate;
  int? age;
  List<History>? history;

  Data(
      {this.nIK,
      this.email,
      this.fullname,
      this.phoneNum,
      this.gender,
      this.vaccineCount,
      this.birthDate,
      this.age,
      this.history});

  Data.fromJson(Map<String, dynamic> json) {
    nIK = json['NIK'];
    email = json['Email'];
    fullname = json['Fullname'];
    phoneNum = json['PhoneNum'];
    gender = json['Gender'];
    vaccineCount = json['VaccineCount'];
    birthDate = json['BirthDate'];
    age = json['Age'];
    if (json['History'] != null) {
      history = <History>[];
      json['History'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
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
    if (history != null) {
      data['History'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String? iD;
  String? idBooking;
  String? nikUser;
  String? idSameBook;
  String? status;
  Booking? booking;

  History(
      {this.iD,
      this.idBooking,
      this.nikUser,
      this.idSameBook,
      this.status,
      this.booking});

  History.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idBooking = json['IdBooking'];
    nikUser = json['NikUser'];
    idSameBook = json['IdSameBook'];
    status = json['Status'];
    booking =
        json['Booking'] != null ? Booking.fromJson(json['Booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdBooking'] = idBooking;
    data['NikUser'] = nikUser;
    data['IdSameBook'] = idSameBook;
    data['Status'] = status;
    if (booking != null) {
      data['Booking'] = booking!.toJson();
    }
    return data;
  }
}

class Booking {
  String? iD;
  String? idSession;
  String? nikUser;
  int? queue;
  String? status;
  Session? session;
  HealthFacilities? healthFacilities;

  Booking(
      {this.iD,
      this.idSession,
      this.nikUser,
      this.queue,
      this.status,
      this.session,
      this.healthFacilities});

  Booking.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idSession = json['IdSession'];
    nikUser = json['NikUser'];
    queue = json['Queue'];
    status = json['Status'];
    session =
        json['Session'] != null ? Session.fromJson(json['Session']) : null;
    healthFacilities = json['HealthFacilities'] != null
        ? HealthFacilities.fromJson(json['HealthFacilities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdSession'] = idSession;
    data['NikUser'] = nikUser;
    data['Queue'] = queue;
    data['Status'] = status;
    if (session != null) {
      data['Session'] = session!.toJson();
    }
    if (healthFacilities != null) {
      data['HealthFacilities'] = healthFacilities!.toJson();
    }
    return data;
  }
}

class HealthFacilities {
  String? iD;
  String? email;
  String? phoneNum;
  String? name;
  String? image;

  HealthFacilities({
    this.iD,
    this.email,
    this.phoneNum,
    this.name,
    this.image,
  });

  HealthFacilities.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    email = json['Email'];
    phoneNum = json['PhoneNum'];
    name = json['Name'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Email'] = email;
    data['PhoneNum'] = phoneNum;
    data['Name'] = name;
    data['Image'] = image;
    return data;
  }
}
