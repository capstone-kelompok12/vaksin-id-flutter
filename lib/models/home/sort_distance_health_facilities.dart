import 'dart:convert';

class SortDistanceHealthFacilities {
  SortDistanceHealthFacilities({
    required this.nama,
    required this.alamat,
    required this.jarak,
    required this.image,
    required this.distanceSort,
    required this.session,

    //user
    required this.namaUser,
    required this.nikUser,
  });

  String? nama;
  String? alamat;
  String? jarak;
  String? image;
  int? distanceSort;
  List? session;

  //user
  String? namaUser;
  String? nikUser;

  factory SortDistanceHealthFacilities.fromRawJson(String str) =>
      SortDistanceHealthFacilities.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  SortDistanceHealthFacilities.fromJson(Map<String, dynamic> json) {
    nama = json["nama"];
    alamat = json["alamat"];
    jarak = json["jarak"];
    image = json["image"];
    distanceSort = json["distanceSort"];
    session =
        List.from(json['Session']).map((e) => Session.fromJson(e)).toList();

    // user
    namaUser = json["namaUser"];
    nikUser = json['nikUser'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["nama"] = nama;
    _data["alamat"] = alamat;
    _data["jarak"] = jarak;
    _data["image"] = image;
    _data["distanceSort"] = distanceSort;
    _data['Session'] = session!.map((e) => e.toJson()).toList();

    // user
    _data["namaUser"] = namaUser;
    _data["nikUser"] = nikUser;
    return _data;
  }
}

class Session {
  Session({
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

  Session.fromJson(Map<String, dynamic> json) {
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
