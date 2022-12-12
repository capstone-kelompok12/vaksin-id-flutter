class ProfileModel {
  Data? data;
  bool? error;
  String? message;

  ProfileModel({
    this.data,
    this.error,
    this.message,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: Data.fromJson(json["data"]),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "error": error,
        "message": message,
      };
}

class Data {
  String? nik;
  String? email;
  String? fullname;
  String? phoneNum;
  String? gender;
  int? vaccineCount;
  int? age;
  Address? address;

  Data({
    this.nik,
    this.email,
    this.fullname,
    this.phoneNum,
    this.gender,
    this.vaccineCount,
    this.age,
    this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nik: json["NIK"],
        email: json["Email"],
        fullname: json["Fullname"],
        phoneNum: json["PhoneNum"],
        gender: json["Gender"],
        vaccineCount: json["VaccineCount"],
        age: json["Age"],
        address: Address.fromJson(json["Address"]),
      );

  Map<String, dynamic> toJson() => {
        "NIK": nik,
        "Email": email,
        "Fullname": fullname,
        "PhoneNum": phoneNum,
        "Gender": gender,
        "VaccineCount": vaccineCount,
        "Age": age,
        "Address": address!.toJson(),
      };
}

class Address {
  String? id;
  String? idHealthFacilities;
  String? nikUser;
  String? currentAddress;
  String? district;
  String? city;
  String? province;
  int? latitude;
  int? longitude;

  Address({
    this.id,
    this.idHealthFacilities,
    this.nikUser,
    this.currentAddress,
    this.district,
    this.city,
    this.province,
    this.latitude,
    this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["ID"],
        idHealthFacilities: json["IdHealthFacilities"],
        nikUser: json["NikUser"],
        currentAddress: json["CurrentAddress"],
        district: json["District"],
        city: json["City"],
        province: json["Province"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "IdHealthFacilities": idHealthFacilities,
        "NikUser": nikUser,
        "CurrentAddress": currentAddress,
        "District": district,
        "City": city,
        "Province": province,
        "Latitude": latitude,
        "Longitude": longitude,
      };
}
