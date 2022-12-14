import 'dart:convert';

class DetailHealthFacilities {
  DetailHealthFacilities({
    required this.data,
    required this.error,
    required this.message,
  });

  Data data;
  bool error;
  String message;

  factory DetailHealthFacilities.fromRawJson(String str) =>
      DetailHealthFacilities.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailHealthFacilities.fromJson(Map<String, dynamic> json) =>
      DetailHealthFacilities(
        data: Data.fromJson(json["data"]),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error,
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.phoneNum,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.address,
    this.session,
    required this.vaccine,
  });

  String id;
  String email;
  String phoneNum;
  String name;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Address address;
  dynamic session;
  List<dynamic> vaccine;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        email: json["Email"],
        phoneNum: json["PhoneNum"],
        name: json["Name"],
        image: json["Image"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        address: Address.fromJson(json["Address"]),
        session: json["Session"],
        vaccine: List<dynamic>.from(json["Vaccine"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Email": email,
        "PhoneNum": phoneNum,
        "Name": name,
        "Image": image,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "Address": address.toJson(),
        "Session": session,
        "Vaccine": List<dynamic>.from(vaccine.map((x) => x)),
      };
}

class Address {
  Address({
    required this.id,
    required this.idHealthFacilities,
    this.nikUser,
    required this.currentAddress,
    required this.district,
    required this.city,
    required this.province,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  String id;
  String idHealthFacilities;
  dynamic nikUser;
  String currentAddress;
  String district;
  String city;
  String province;
  double latitude;
  double longitude;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["ID"],
        idHealthFacilities: json["IdHealthFacilities"],
        nikUser: json["NikUser"],
        currentAddress: json["CurrentAddress"],
        district: json["District"],
        city: json["City"],
        province: json["Province"],
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
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
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
      };
}
