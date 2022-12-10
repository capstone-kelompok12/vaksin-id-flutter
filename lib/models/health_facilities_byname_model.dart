class HealthFacilitiesByName {
  HealthFacilitiesByName({
    required this.data,
    required this.error,
    required this.message,
  });
  late final Data data;
  late final bool error;
  late final String message;

  HealthFacilitiesByName.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['error'] = error;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.ID,
    required this.Email,
    required this.PhoneNum,
    required this.Name,
    required this.Image,
    required this.Address,
    required this.Session,
    required this.Vaccine,
  });
  late final String ID;
  late final String Email;
  late final String PhoneNum;
  late final String Name;
  late final String Image;
  late final AddressModel Address;
  late final String Session;
  late final List<dynamic> Vaccine;

  Data.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Email = json['Email'];
    PhoneNum = json['PhoneNum'];
    Name = json['Name'];
    Image = json['Image'];
    Address = AddressModel.fromJson(json['Address']);
    Session = json['Session'];
    Vaccine = List.castFrom<dynamic, dynamic>(json['Vaccine']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['Email'] = Email;
    _data['PhoneNum'] = PhoneNum;
    _data['Name'] = Name;
    _data['Image'] = Image;
    _data['Address'] = Address.toJson();
    _data['Session'] = Session;
    _data['Vaccine'] = Vaccine;
    return _data;
  }
}

class AddressModel {
  AddressModel({
    required this.ID,
    required this.IdHealthFacilities,
    this.NikUser,
    required this.CurrentAddress,
    required this.District,
    required this.City,
    required this.Province,
    required this.Latitude,
    required this.Longitude,
  });
  late final String ID;
  late final String IdHealthFacilities;
  late final Null NikUser;
  late final String CurrentAddress;
  late final String District;
  late final String City;
  late final String Province;
  late final double Latitude;
  late final double Longitude;

  AddressModel.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    IdHealthFacilities = json['IdHealthFacilities'];
    NikUser = null;
    CurrentAddress = json['CurrentAddress'];
    District = json['District'];
    City = json['City'];
    Province = json['Province'];
    Latitude = json['Latitude'];
    Longitude = json['Longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['IdHealthFacilities'] = IdHealthFacilities;
    _data['NikUser'] = NikUser;
    _data['CurrentAddress'] = CurrentAddress;
    _data['District'] = District;
    _data['City'] = City;
    _data['Province'] = Province;
    _data['Latitude'] = Latitude;
    _data['Longitude'] = Longitude;
    return _data;
  }
}
