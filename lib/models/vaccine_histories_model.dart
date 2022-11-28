class VaccineHistoriesModel {
  String? id;
  String? idBooking;
  String? status;

  VaccineHistoriesModel({
    required this.id,
    this.idBooking,
    this.status,
  });

  VaccineHistoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBooking = json['id_booking'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_booking'] = this.idBooking;
    data['status'] = this.status;

    return data;
  }
}
