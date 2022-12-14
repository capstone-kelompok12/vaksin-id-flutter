class UserModel {
  UserModel({
    this.data,
    this.error,
    this.message,
  });
  late final Data? data;
  late final bool? error;
  late final String? message;

  UserModel.fromJson(Map<String?, dynamic> json) {
    data = Data.fromJson(json['data']);
    error = json['error'];
    message = json['message'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['data'] = data!.toJson();
    _data['error'] = error;
    _data['message'] = message;
    return _data;
  }
}

class Data {
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
  late final String? nik;
  late final String? email;
  late final String? fullname;
  late final String? phoneNum;
  late final String? gender;
  late final int? vaccineCount;
  late final int? age;
  late final AddressUser? address;

  Data.fromJson(Map<String?, dynamic> json) {
    nik = json['NIK'];
    email = json['Email'];
    fullname = json['Fullname'];
    phoneNum = json['PhoneNum'];
    gender = json['Gender'];
    vaccineCount = json['VaccineCount'];
    age = json['Age'];
    address = AddressUser.fromJson(json['Address']);
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['NIK'] = nik;
    _data['Email'] = email;
    _data['Fullname'] = fullname;
    _data['PhoneNum'] = phoneNum;
    _data['Gender'] = gender;
    _data['VaccineCount'] = vaccineCount;
    _data['Age'] = age;
    _data['Address'] = address!.toJson();
    return _data;
  }
}

class AddressUser {
  AddressUser({
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
  late final String? id;
  late final String? idHealthFacilities;
  late final String? nikUser;
  late final String? currentAddress;
  late final String? district;
  late final String? city;
  late final String? province;
  late final int? latitude;
  late final int? longitude;

  AddressUser.fromJson(Map<String?, dynamic> json) {
    id = json['ID'];
    idHealthFacilities = null;
    nikUser = json['NikUser'];
    currentAddress = json['CurrentAddress'];
    district = json['District'];
    city = json['City'];
    province = json['Province'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['ID'] = id;
    _data['IdHealthFacilities'] = idHealthFacilities;
    _data['NikUser'] = nikUser;
    _data['CurrentAddress'] = currentAddress;
    _data['District'] = district;
    _data['City'] = city;
    _data['Province'] = province;
    _data['Latitude'] = latitude;
    _data['Longitude'] = longitude;
    return _data;
  }
}
