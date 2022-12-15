class ProfileModel {
  ProfileModel({
    this.dataUser,
    this.error,
    this.message,
  });
  late final Data? dataUser;
  late final bool? error;
  late final String? message;

  ProfileModel.fromJson(Map<String?, dynamic> json) {
    dataUser = Data.fromJson(json['data']);
    error = json['error'];
    message = json['message'];
  }

  Map<String?, dynamic> toJson() {
    final data = <String?, dynamic>{};
    data['data'] = dataUser!.toJson();
    data['error'] = error;
    data['message'] = message;
    return data;
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
    final data = <String?, dynamic>{};
    data['NIK'] = nik;
    data['Email'] = email;
    data['Fullname'] = fullname;
    data['PhoneNum'] = phoneNum;
    data['Gender'] = gender;
    data['VaccineCount'] = vaccineCount;
    data['Age'] = age;
    data['Address'] = address!.toJson();
    return data;
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
    final data = <String?, dynamic>{};
    data['ID'] = id;
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
