import 'package:flutter/src/material/dropdown.dart';
import 'package:vaksin_id_flutter/models/session_model.dart';

class Vaccine {
  String? iD;
  String? idHealthFacilities;
  String? name;
  int? stock;
  int? dose;
  String? createdAt;
  String? updatedAt;
  List<Session>? session;

  Vaccine(
      {this.iD,
      this.idHealthFacilities,
      this.name,
      this.stock,
      this.dose,
      this.createdAt,
      this.updatedAt,
      this.session});

  Vaccine.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idHealthFacilities = json['IdHealthFacilities'];
    name = json['Name'];
    stock = json['Stock'];
    dose = json['Dose'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    if (json['Session'] != null) {
      session = <Session>[];
      json['Session'].forEach((v) {
        session!.add(Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdHealthFacilities'] = idHealthFacilities;
    data['Name'] = name;
    data['Stock'] = stock;
    data['Dose'] = dose;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    if (session != null) {
      data['Session'] = session!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  map(DropdownMenuItem<Object> Function(dynamic e) param0) {}
}
