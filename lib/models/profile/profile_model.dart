class ProfileModel {
  Data? data;
  bool? error;
  String? message;

  ProfileModel({this.data, this.error, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? age;
  Address? address;

  Data(
      {this.nIK,
      this.email,
      this.fullname,
      this.phoneNum,
      this.gender,
      this.vaccineCount,
      this.age,
      this.address});

  Data.fromJson(Map<String, dynamic> json) {
    nIK = json['NIK'];
    email = json['Email'];
    fullname = json['Fullname'];
    phoneNum = json['PhoneNum'];
    gender = json['Gender'];
    vaccineCount = json['VaccineCount'];
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
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Address(
      {this.iD,
      this.idHealthFacilities,
      this.nikUser,
      this.currentAddress,
      this.district,
      this.city,
      this.province,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

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
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
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
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    data['DeletedAt'] = deletedAt;
    return data;
  }
}
