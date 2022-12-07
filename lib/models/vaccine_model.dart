class VaccineModel {
  String? id;
  String? idHospital;
  String? vacchineName;
  String? stock;

  VaccineModel({
    required this.id,
    required this.idHospital,
    required this.vacchineName,
    required this.stock,
  });

  factory VaccineModel.fromJson(Map<String, dynamic> json) => VaccineModel(
        id: json['id'],
        idHospital: json['id_healthfacilities'],
        vacchineName: json['name'],
        stock: json['stock'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_healthfacilities': idHospital,
        'name': vacchineName,
        'stock': stock,
      };
}
