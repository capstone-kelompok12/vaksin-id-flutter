import 'dart:convert';

class SortDistanceHealthFacilities {
  SortDistanceHealthFacilities({
    required this.nama,
    required this.alamat,
    required this.jarak,
    required this.distanceSort,
  });

  String nama;
  String alamat;
  String jarak;
  int distanceSort;

  factory SortDistanceHealthFacilities.fromRawJson(String str) =>
      SortDistanceHealthFacilities.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SortDistanceHealthFacilities.fromJson(Map<String, dynamic> json) =>
      SortDistanceHealthFacilities(
        nama: json["nama"],
        alamat: json["alamat"],
        jarak: json["jarak"],
        distanceSort: json["distanceSort"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "alamat": alamat,
        "jarak": jarak,
        "distanceSort": distanceSort,
      };
}
