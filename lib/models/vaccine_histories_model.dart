class VaccineHistoriesModel {
  String? id;
  String? idBooking;
  String? status;

  VaccineHistoriesModel({
    required this.id,
    required this.idBooking,
    required this.status,
  });

  factory VaccineHistoriesModel.fromJson(Map<String, dynamic> json) =>
      VaccineHistoriesModel(
        id: json['id'],
        idBooking: json['id_booking'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_booking': idBooking,
        'status': status,
      };
}
