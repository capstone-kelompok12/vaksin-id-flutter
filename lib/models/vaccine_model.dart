class VaccineModel {
  String? id;
  String? idHospital;
  String? vacchineName;
  String? stock;

  VaccineModel({
    required this.id,
    required this.idHospital,
    this.vacchineName,
    this.stock,
  });

  VaccineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idHospital = json['id_healthfacilities'];
    vacchineName = json['name'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_healthfacilities'] = this.idHospital;
    data['name'] = this.vacchineName;
    data['stock'] = this.stock;
    return data;
  }
}
