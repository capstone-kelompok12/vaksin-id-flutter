class HealthFacilitiesModel {
  String? iD;
  String? email;
  String? phoneNum;
  String? name;
  String? image;
  Address? address;
  String? session;
  List<Vaccine>? vaccine;

  HealthFacilitiesModel(
      {this.iD,
      this.email,
      this.phoneNum,
      this.name,
      this.image,
      this.address,
      this.session,
      this.vaccine});

  HealthFacilitiesModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    email = json['Email'];
    phoneNum = json['PhoneNum'];
    name = json['Name'];
    image = json['Image'];
    address =
        json['Address'] != null ? new Address.fromJson(json['Address']) : null;
    session = json['Session'];
    if (json['Vaccine'] != null) {
      vaccine = <Vaccine>[];
      json['Vaccine'].forEach((v) {
        vaccine!.add(new Vaccine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Email'] = this.email;
    data['PhoneNum'] = this.phoneNum;
    data['Name'] = this.name;
    data['Image'] = this.image;
    if (this.address != null) {
      data['Address'] = this.address!.toJson();
    }
    data['Session'] = this.session;
    if (this.vaccine != null) {
      data['Vaccine'] = this.vaccine!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IdHealthFacilities'] = this.idHealthFacilities;
    data['NikUser'] = this.nikUser;
    data['CurrentAddress'] = this.currentAddress;
    data['District'] = this.district;
    data['City'] = this.city;
    data['Province'] = this.province;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    return data;
  }
}

class Vaccine {
  String? iD;
  String? idHealthFacilities;
  String? name;
  int? stock;

  Vaccine({
    this.iD,
    this.idHealthFacilities,
    this.name,
    this.stock,
  });

  Vaccine.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idHealthFacilities = json['IdHealthFacilities'];
    name = json['Name'];
    stock = json['Stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IdHealthFacilities'] = this.idHealthFacilities;
    data['Name'] = this.name;
    data['Stock'] = this.stock;
    return data;
  }

  // String toString() {
  //   return '{$iD, $idHealthFacilities, $name, $stock}';
  // }
}
