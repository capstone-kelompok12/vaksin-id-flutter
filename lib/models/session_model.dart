import 'package:vaksin_id_flutter/models/vaccine_model.dart';

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
  String? createdAt;
  String? updatedAt;
  Vaccine? vaccine;
  List? booking;

  Session(
      {this.iD,
      this.idVaccine,
      this.sessionName,
      this.capacity,
      this.dose,
      this.date,
      this.isClose,
      this.startSession,
      this.endSession,
      this.createdAt,
      this.updatedAt,
      this.vaccine,
      this.booking});

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
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    vaccine =
        json['Vaccine'] != null ? Vaccine.fromJson(json['Vaccine']) : null;
    booking = json['Booking'];
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
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    if (vaccine != null) {
      data['Vaccine'] = vaccine!.toJson();
    }
    data['Booking'] = booking;
    return data;
  }
}
