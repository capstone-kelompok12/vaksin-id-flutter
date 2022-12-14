// class NearbyHealthFacilitiesModel {
//   Data? data;
//   bool? error;
//   String? message;

//   NearbyHealthFacilitiesModel({this.data, this.error, this.message});

//   NearbyHealthFacilitiesModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//     error = json['error'];
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['error'] = error;
//     data['message'] = message;
//     return data;
//   }
// }

// class Data {
//   User? user;
//   List<HealthFacilities>? healthFacilities;

//   Data({this.user, this.healthFacilities});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['User'] != null ? User.fromJson(json['User']) : null;
//     if (json['HealthFacilities'] != null) {
//       healthFacilities = <HealthFacilities>[];
//       json['HealthFacilities'].forEach((v) {
//         healthFacilities!.add(HealthFacilities.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (user != null) {
//       data['User'] = user!.toJson();
//     }
//     if (healthFacilities != null) {
//       data['HealthFacilities'] =
//           healthFacilities!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class User {
//   String? nIK;
//   String? email;
//   String? fullname;
//   String? phoneNum;
//   String? gender;
//   int? vaccineCount;
//   int? age;
//   Address? address;

//   User(
//       {this.nIK,
//       this.email,
//       this.fullname,
//       this.phoneNum,
//       this.gender,
//       this.vaccineCount,
//       this.age,
//       this.address});

//   User.fromJson(Map<String, dynamic> json) {
//     nIK = json['NIK'];
//     email = json['Email'];
//     fullname = json['Fullname'];
//     phoneNum = json['PhoneNum'];
//     gender = json['Gender'];
//     vaccineCount = json['VaccineCount'];
//     age = json['Age'];
//     address =
//         json['Address'] != null ? Address.fromJson(json['Address']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['NIK'] = nIK;
//     data['Email'] = email;
//     data['Fullname'] = fullname;
//     data['PhoneNum'] = phoneNum;
//     data['Gender'] = gender;
//     data['VaccineCount'] = vaccineCount;
//     data['Age'] = age;
//     if (address != null) {
//       data['Address'] = address!.toJson();
//     }
//     return data;
//   }
// }

// // class Address {
// //   String? iD;
// //   Null? idHealthFacilities;
// //   String? nikUser;
// //   String? currentAddress;
// //   String? district;
// //   String? city;
// //   String? province;
// //   double? latitude;
// //   double? longitude;
// //   String? createdAt;
// //   String? updatedAt;
// //   Null? deletedAt;

// //   Address(
// //       {this.iD,
// //       this.idHealthFacilities,
// //       this.nikUser,
// //       this.currentAddress,
// //       this.district,
// //       this.city,
// //       this.province,
// //       this.latitude,
// //       this.longitude,
// //       this.createdAt,
// //       this.updatedAt,
// //       this.deletedAt});

// //   Address.fromJson(Map<String, dynamic> json) {
// //     iD = json['ID'];
// //     idHealthFacilities = json['IdHealthFacilities'];
// //     nikUser = json['NikUser'];
// //     currentAddress = json['CurrentAddress'];
// //     district = json['District'];
// //     city = json['City'];
// //     province = json['Province'];
// //     latitude = json['Latitude'];
// //     longitude = json['Longitude'];
// //     createdAt = json['CreatedAt'];
// //     updatedAt = json['UpdatedAt'];
// //     deletedAt = json['DeletedAt'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['ID'] = this.iD;
// //     data['IdHealthFacilities'] = this.idHealthFacilities;
// //     data['NikUser'] = this.nikUser;
// //     data['CurrentAddress'] = this.currentAddress;
// //     data['District'] = this.district;
// //     data['City'] = this.city;
// //     data['Province'] = this.province;
// //     data['Latitude'] = this.latitude;
// //     data['Longitude'] = this.longitude;
// //     data['CreatedAt'] = this.createdAt;
// //     data['UpdatedAt'] = this.updatedAt;
// //     data['DeletedAt'] = this.deletedAt;
// //     return data;
// //   }
// // }

// class HealthFacilities {
//   String? iD;
//   String? email;
//   String? phoneNum;
//   String? name;
//   Null? image;
//   int? ranges;
//   Address? address;

//   HealthFacilities(
//       {this.iD,
//       this.email,
//       this.phoneNum,
//       this.name,
//       this.image,
//       this.ranges,
//       this.address});

//   HealthFacilities.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     email = json['Email'];
//     phoneNum = json['PhoneNum'];
//     name = json['Name'];
//     image = json['Image'];
//     ranges = json['Ranges'];
//     address =
//         json['Address'] != null ? Address.fromJson(json['Address']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['ID'] = iD;
//     data['Email'] = email;
//     data['PhoneNum'] = phoneNum;
//     data['Name'] = name;
//     data['Image'] = image;
//     data['Ranges'] = ranges;
//     if (address != null) {
//       data['Address'] = address!.toJson();
//     }
//     return data;
//   }
// }

// class Address {
//   String? iD;
//   String? idHealthFacilities;
//   String? nikUser;
//   String? currentAddress;
//   String? district;
//   String? city;
//   String? province;
//   double? latitude;
//   double? longitude;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   Address(
//       {this.iD,
//       this.idHealthFacilities,
//       this.nikUser,
//       this.currentAddress,
//       this.district,
//       this.city,
//       this.province,
//       this.latitude,
//       this.longitude,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt});

//   Address.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     idHealthFacilities = json['IdHealthFacilities'];
//     nikUser = json['NikUser'];
//     currentAddress = json['CurrentAddress'];
//     district = json['District'];
//     city = json['City'];
//     province = json['Province'];
//     latitude = json['Latitude'];
//     longitude = json['Longitude'];
//     createdAt = json['CreatedAt'];
//     updatedAt = json['UpdatedAt'];
//     deletedAt = json['DeletedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['ID'] = iD;
//     data['IdHealthFacilities'] = idHealthFacilities;
//     data['NikUser'] = nikUser;
//     data['CurrentAddress'] = currentAddress;
//     data['District'] = district;
//     data['City'] = city;
//     data['Province'] = province;
//     data['Latitude'] = latitude;
//     data['Longitude'] = longitude;
//     data['CreatedAt'] = createdAt;
//     data['UpdatedAt'] = updatedAt;
//     data['DeletedAt'] = deletedAt;
//     return data;
//   }
// }

class NearbyHealthFacilitiesModel {
  NearbyHealthFacilitiesModel({
    this.data,
    this.error,
    this.message,
  });
  late final Data? data;
  late final bool? error;
  late final String? message;

  NearbyHealthFacilitiesModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.toJson();
    _data['error'] = error;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    this.user,
    this.healthFacilities,
  });
  late final UserNF? user;
  late final List<HealthFacilitiesNF>? healthFacilities;

  Data.fromJson(Map<String, dynamic> json) {
    user = UserNF.fromJson(json['User']);
    healthFacilities = List.from(json['HealthFacilities'])
        .map((e) => HealthFacilitiesNF.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['User'] = user!.toJson();
    _data['HealthFacilities'] =
        healthFacilities!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserNF {
  UserNF({
    required this.nik,
    this.email,
    this.fullname,
    this.phoneNum,
    this.gender,
    this.vaccineCount,
    this.age,
    // this.address,
  });
  late final String nik;
  late final String? email;
  late final String? fullname;
  late final String? phoneNum;
  late final String? gender;
  late final int? vaccineCount;
  late final int? age;
  // late final AddressNF? address;

  UserNF.fromJson(Map<String, dynamic> json) {
    nik = json['NIK'];
    email = json['Email'];
    fullname = json['Fullname'];
    phoneNum = json['PhoneNum'];
    gender = json['Gender'];
    vaccineCount = json['VaccineCount'];
    age = json['Age'];
    // address = AddressNF.fromJson(json['Address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['NIK'] = nik;
    _data['Email'] = email;
    _data['Fullname'] = fullname;
    _data['PhoneNum'] = phoneNum;
    _data['Gender'] = gender;
    _data['VaccineCount'] = vaccineCount;
    _data['Age'] = age;
    // _data['Address'] = address!.toJson();
    return _data;
  }
}

class AddressNF {
  AddressNF({
    required this.id,
    this.idHealthFacilities,
    this.nikUser,
    this.currentAddress,
    this.district,
    this.city,
    this.province,
    this.latitude,
    this.longitude,
  });
  late final String id;
  late final String? idHealthFacilities;
  late final String? nikUser;
  late final String? currentAddress;
  late final String? district;
  late final String? city;
  late final String? province;
  late final double? latitude;
  late final double? longitude;

  AddressNF.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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

class HealthFacilitiesNF {
  HealthFacilitiesNF({
    required this.id,
    this.email,
    this.phoneNum,
    this.name,
    this.image,
    this.ranges,
    this.address,
    this.session,
  });
  late final String id;
  late final String? email;
  late final String? phoneNum;
  late final String? name;
  late final String? image;
  late final double? ranges;
  late final AddressNF? address;
  late final List? session;

  HealthFacilitiesNF.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    email = json['Email'];
    phoneNum = json['PhoneNum'];
    name = json['Name'];
    image = json['Image'];
    ranges = json['Ranges'];
    address = AddressNF.fromJson(json['Address']);
    session =
        List.from(json['Session']).map((e) => SessionNF.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = id;
    _data['Email'] = email;
    _data['PhoneNum'] = phoneNum;
    _data['Name'] = name;
    _data['Image'] = image;
    _data['Ranges'] = ranges;
    _data['Address'] = address!.toJson();
    _data['Session'] = session!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SessionNF {
  SessionNF({
    required this.id,
    required this.idHealthFacilities,
    required this.sessionName,
    required this.capacity,
    required this.dose,
    required this.isClose,
    required this.startSession,
    required this.endSession,
    required this.booking,
  });
  late final String id;
  late final String idHealthFacilities;
  late final String sessionName;
  late final int capacity;
  late final int dose;
  late final bool isClose;
  late final String startSession;
  late final String endSession;
  late final List<dynamic> booking;

  SessionNF.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    idHealthFacilities = json['IdHealthFacilities'];
    sessionName = json['SessionName'];
    capacity = json['Capacity'];
    dose = json['Dose'];
    isClose = json['IsClose'];
    startSession = json['StartSession'];
    endSession = json['EndSession'];
    booking = List.castFrom<dynamic, dynamic>(json['Booking']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = id;
    _data['IdHealthFacilities'] = idHealthFacilities;
    _data['SessionName'] = sessionName;
    _data['Capacity'] = capacity;
    _data['Dose'] = dose;
    _data['IsClose'] = isClose;
    _data['StartSession'] = startSession;
    _data['EndSession'] = endSession;
    _data['Booking'] = booking;
    return _data;
  }
}
