class HealthFacilitiesModel {
  String? id;
  String? email;
  String? password;
  String? phoneNum;
  String? name;

  HealthFacilitiesModel({
    this.id,
    this.email,
    this.password,
    this.phoneNum,
    this.name,
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

// class HealthFacilitiesModel {
//   List<Data> data = [];

//   HealthFacilitiesModel({required this.data});

//   factory HealthFacilitiesModel.fromJson(Map<String, dynamic> json) =>
//       HealthFacilitiesModel(
//         data: json['data'],
//       );

//   Map<String, dynamic> toJson() => {
//         'data': data,
//       };
// }

// class Data {
//   String? id;
//   String? email;
//   String? password;
//   String? phoneNum;
//   String? name;

//   Data({
//     required this.id,
//     required this.email,
//     required this.password,
//     required this.phoneNum,
//     required this.name,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json['id'],
//         email: json['email'],
//         password: json['password'],
//         phoneNum: json['phone_num'],
//         name: json['name'],
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'email': email,
//         'password': password,
//         'phone_num': phoneNum,
//         'name': name,
//       };
// }

