class HealthFacilitiesModel {
  String? id;
  String? email;
  String? password;
  String? phoneNum;
  String? name;

  HealthFacilitiesModel({
    required this.id,
    required this.email,
    required this.password,
    required this.phoneNum,
    required this.name,
  });

  factory HealthFacilitiesModel.fromJson(Map<String, dynamic> json) =>
      HealthFacilitiesModel(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        phoneNum: json['phone_num'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'phone_num': phoneNum,
        'name': name,
      };
}
