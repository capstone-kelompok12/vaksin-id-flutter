class HealthFacilitiesModel {
  String? id;
  String? email;
  String? password;
  String? phoneNum;
  String? name;

  HealthFacilitiesModel({
    required this.id,
    this.email,
    this.password,
    this.phoneNum,
    this.name,
  });

  HealthFacilitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    phoneNum = json['phone_num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_num'] = this.phoneNum;
    data['name'] = this.name;

    return data;
  }
}
