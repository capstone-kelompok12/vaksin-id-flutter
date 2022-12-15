class Session {
  String? iD;
  String? idHealthFacilities;
  String? sessionName;
  int? capacity;
  int? dose;
  bool? isClose;
  String? startSession;
  String? endSession;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? booking;

  Session(
      {this.iD,
      this.idHealthFacilities,
      this.sessionName,
      this.capacity,
      this.dose,
      this.isClose,
      this.startSession,
      this.endSession,
      this.createdAt,
      this.updatedAt,
      this.booking});

  Session.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    idHealthFacilities = json['IdHealthFacilities'];
    sessionName = json['SessionName'];
    capacity = json['Capacity'];
    dose = json['Dose'];
    isClose = json['IsClose'];
    startSession = json['StartSession'];
    endSession = json['EndSession'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    if (json['Booking'] != null) {
      booking = <dynamic>[];
      json['Booking'].forEach((v) {
        booking!.add(v.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['IdHealthFacilities'] = idHealthFacilities;
    data['SessionName'] = sessionName;
    data['Capacity'] = capacity;
    data['Dose'] = dose;
    data['IsClose'] = isClose;
    data['StartSession'] = startSession;
    data['EndSession'] = endSession;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    if (booking != null) {
      data['Booking'] = booking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}