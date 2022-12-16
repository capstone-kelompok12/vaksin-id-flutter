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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  Address? address;
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
      this.address,
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
    address =
        json['Address'] != null ? Address.fromJson(json['Address']) : null;
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
    if (address != null) {
      data['Address'] = address!.toJson();
    }
    if (history != null) {
      data['History'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? iD;
  String? nikUser;
  String? currentAddress;
  String? district;
  String? city;
  String? province;
  int? latitude;
  int? longitude;

  Address({
    this.iD,
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

class History {
  String? iD;
  String? idBooking;
  String? nikUser;
  String? idSameBook;
  String? status;
  User? user;
  Booking? booking;

  History(
      {this.iD,
      this.idBooking,
      this.nikUser,
      this.idSameBook,
      this.status,
      this.user,
      this.booking});

  History.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idBooking = json['IdBooking'];
    nikUser = json['NikUser'];
    idSameBook = json['IdSameBook'];
    status = json['Status'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
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
    if (user != null) {
      data['User'] = user!.toJson();
    }
    if (booking != null) {
      data['Booking'] = booking!.toJson();
    }
    return data;
  }
}

class User {
  String? nIK;
  String? email;
  String? password;
  String? fullname;
  String? phoneNum;
  String? gender;
  int? vaccineCount;
  String? birthDate;

  User({
    this.nIK,
    this.email,
    this.password,
    this.fullname,
    this.phoneNum,
    this.gender,
    this.vaccineCount,
    this.birthDate,
  });

  User.fromJson(Map<String, dynamic> json) {
    nIK = json['NIK'];
    email = json['Email'];
    password = json['Password'];
    fullname = json['Fullname'];
    phoneNum = json['PhoneNum'];
    gender = json['Gender'];
    vaccineCount = json['VaccineCount'];
    birthDate = json['BirthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NIK'] = nIK;
    data['Email'] = email;
    data['Password'] = password;
    data['Fullname'] = fullname;
    data['PhoneNum'] = phoneNum;
    data['Gender'] = gender;
    data['VaccineCount'] = vaccineCount;
    data['BirthDate'] = birthDate;
    return data;
  }
}

class Booking {
  String? iD;
  String? idSession;
  int? queue;
  String? status;
  Session? session;

  Booking({
    this.iD,
    this.idSession,
    this.queue,
    this.status,
    this.session,
  });

  Booking.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idSession = json['IdSession'];
    queue = json['Queue'];
    status = json['Status'];
    session =
        json['Session'] != null ? Session.fromJson(json['Session']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdSession'] = idSession;
    data['Queue'] = queue;
    data['Status'] = status;
    if (session != null) {
      data['Session'] = session!.toJson();
    }
    return data;
  }
}

class Session {
  String? iD;
  String? idVaccine;
  String? sessionName;
  int? capacity;
  int? dose;
  String? date;
  bool? isClose;
  String? startSession;
  String? endSession;
  Vaccine? vaccine;

  Session({
    this.iD,
    this.idVaccine,
    this.sessionName,
    this.capacity,
    this.dose,
    this.date,
    this.isClose,
    this.startSession,
    this.endSession,
    this.vaccine,
  });

  Session.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idVaccine = json['IdVaccine'];
    sessionName = json['SessionName'];
    capacity = json['Capacity'];
    dose = json['Dose'];
    date = json['Date'];
    isClose = json['IsClose'];
    startSession = json['StartSession'];
    endSession = json['EndSession'];
    vaccine =
        json['Vaccine'] != null ? Vaccine.fromJson(json['Vaccine']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdVaccine'] = idVaccine;
    data['SessionName'] = sessionName;
    data['Capacity'] = capacity;
    data['Dose'] = dose;
    data['Date'] = date;
    data['IsClose'] = isClose;
    data['StartSession'] = startSession;
    data['EndSession'] = endSession;
    if (this.vaccine != null) {
      data['Vaccine'] = vaccine!.toJson();
    }
    return data;
  }
}

class Vaccine {
  String? iD;
  String? idHealthFacilities;
  String? name;
  int? stock;
  int? dose;
  String? createdAt;
  String? updatedAt;

  Vaccine({
    this.iD,
    this.idHealthFacilities,
    this.name,
    this.stock,
    this.dose,
  });

  Vaccine.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idHealthFacilities = json['IdHealthFacilities'];
    name = json['Name'];
    stock = json['Stock'];
    dose = json['Dose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdHealthFacilities'] = idHealthFacilities;
    data['Name'] = name;
    data['Stock'] = stock;
    data['Dose'] = dose;
    return data;
  }
}
