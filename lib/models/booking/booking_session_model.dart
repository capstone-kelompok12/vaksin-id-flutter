class BookingModel {
  BookingModel({
    this.data,
    this.error,
    this.messages,
  });
  late final List<Data>? data;
  late final bool? error;
  late final String? messages;

  BookingModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    error = json['error'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.map((e) => e.toJson()).toList();
    _data['error'] = error;
    _data['messages'] = messages;
    return _data;
  }
}

class Data {
  Data({
    this.ID,
    this.IdBooking,
    this.NikUser,
    this.IdSameBook,
    this.Status,
    this.CreatedAt,
    this.UpdatedAt,
    this.User,
    this.Booking,
  });
  late final String? ID;
  late final String? IdBooking;
  late final String? NikUser;
  late final String? IdSameBook;
  late final String? Status;
  late final String? CreatedAt;
  late final String? UpdatedAt;
  late final UserBook? User;
  late final BookingBook? Booking;

  Data.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    IdBooking = json['IdBooking'];
    NikUser = json['NikUser'];
    IdSameBook = json['IdSameBook'];
    Status = json['Status'];
    CreatedAt = json['CreatedAt'];
    UpdatedAt = json['UpdatedAt'];
    User = UserBook.fromJson(json['User']);
    Booking = BookingBook.fromJson(json['Booking']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['IdBooking'] = IdBooking;
    _data['NikUser'] = NikUser;
    _data['IdSameBook'] = IdSameBook;
    _data['Status'] = Status;
    _data['CreatedAt'] = CreatedAt;
    _data['UpdatedAt'] = UpdatedAt;
    _data['User'] = User!.toJson();
    _data['Booking'] = Booking!.toJson();
    return _data;
  }
}

class UserBook {
  UserBook({
    this.NIK,
    this.Email,
    this.Password,
    this.Fullname,
    this.PhoneNum,
    this.ProfileImage,
    this.Gender,
    this.VaccineCount,
    this.BirthDate,
    this.Address,
    this.History,
  });
  late final String? NIK;
  late final String? Email;
  late final String? Password;
  late final String? Fullname;
  late final String? PhoneNum;
  late final String? ProfileImage;
  late final String? Gender;
  late final int? VaccineCount;
  late final String? BirthDate;
  late final AddressBook? Address;
  late final Null? History;

  UserBook.fromJson(Map<String, dynamic> json) {
    NIK = json['NIK'];
    Email = json['Email'];
    Password = json['Password'];
    Fullname = json['Fullname'];
    PhoneNum = json['PhoneNum'];
    ProfileImage = null;
    Gender = json['Gender'];
    VaccineCount = json['VaccineCount'];
    BirthDate = json['BirthDate'];
    Address = AddressBook.fromJson(json['Address']);
    History = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['NIK'] = NIK;
    _data['Email'] = Email;
    _data['Password'] = Password;
    _data['Fullname'] = Fullname;
    _data['PhoneNum'] = PhoneNum;
    _data['ProfileImage'] = ProfileImage;
    _data['Gender'] = Gender;
    _data['VaccineCount'] = VaccineCount;
    _data['BirthDate'] = BirthDate;
    _data['Address'] = Address!.toJson();
    _data['History'] = History;
    return _data;
  }
}

class AddressBook {
  AddressBook({
    this.ID,
    this.IdHealthFacilities,
    this.NikUser,
    this.CurrentAddress,
    this.District,
    this.City,
    this.Province,
    this.Latitude,
    this.Longitude,
  });
  late final String? ID;
  late final String? IdHealthFacilities;
  late final String? NikUser;
  late final String? CurrentAddress;
  late final String? District;
  late final String? City;
  late final String? Province;
  late final int? Latitude;
  late final int? Longitude;

  AddressBook.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    IdHealthFacilities = null;
    NikUser = json['NikUser'];
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

class BookingBook {
  BookingBook({
    this.ID,
    this.IdSession,
    this.Queue,
    this.Status,
    this.Session,
    this.History,
  });
  late final String? ID;
  late final String? IdSession;
  late final int? Queue;
  late final String? Status;
  late final SessionBook? Session;
  late final Null History;

  BookingBook.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    IdSession = json['IdSession'];
    Queue = null;
    Status = null;
    Session = SessionBook.fromJson(json['Session']);
    History = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['IdSession'] = IdSession;
    _data['Queue'] = Queue;
    _data['Status'] = Status;
    _data['Session'] = Session!.toJson();
    _data['History'] = History;
    return _data;
  }
}

class SessionBook {
  SessionBook({
    this.ID,
    this.IdHealthFacilities,
    this.SessionName,
    this.Capacity,
    this.Dose,
    this.IsClose,
    this.StartSession,
    this.EndSession,
    this.CreatedAt,
    this.UpdatedAt,
    this.Booking,
  });
  late final String? ID;
  late final String? IdHealthFacilities;
  late final String? SessionName;
  late final int? Capacity;
  late final int? Dose;
  late final bool? IsClose;
  late final String? StartSession;
  late final String? EndSession;
  late final String? CreatedAt;
  late final String? UpdatedAt;
  late final Null Booking;

  SessionBook.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    IdHealthFacilities = json['IdHealthFacilities'];
    SessionName = json['SessionName'];
    Capacity = json['Capacity'];
    Dose = json['Dose'];
    IsClose = json['IsClose'];
    StartSession = json['StartSession'];
    EndSession = json['EndSession'];
    CreatedAt = json['CreatedAt'];
    UpdatedAt = json['UpdatedAt'];
    Booking = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['IdHealthFacilities'] = IdHealthFacilities;
    _data['SessionName'] = SessionName;
    _data['Capacity'] = Capacity;
    _data['Dose'] = Dose;
    _data['IsClose'] = IsClose;
    _data['StartSession'] = StartSession;
    _data['EndSession'] = EndSession;
    _data['CreatedAt'] = CreatedAt;
    _data['UpdatedAt'] = UpdatedAt;
    _data['Booking'] = Booking;
    return _data;
  }
}
