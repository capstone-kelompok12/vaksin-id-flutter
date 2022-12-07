class UserModel {
  int? nik;
  String? email;
  String? fullname;
  String? phoneNum;
  String? gender;
  int? vachineCount;
  int? age;

  UserModel({
    required this.nik,
    required this.email,
    required this.fullname,
    required this.phoneNum,
    required this.gender,
    required this.vachineCount,
    required this.age,
  });

  factory UserModel.fronJson(Map<String, dynamic> json) => UserModel(
        nik: json['NIK'],
        email: json['Email'],
        fullname: json['Fullname'],
        phoneNum: json['PhoneNum'],
        gender: json['Gender'],
        vachineCount: json['VaccineCount'],
        age: json['Age'],
      );

  Map<String, dynamic> toJson() => {
        'NIK': nik,
        'Email': email,
        'Fullname': fullname,
        'PhoneNum': phoneNum,
        'Gender': gender,
        'VaccineCount': vachineCount,
        'Age': age,
      };
}
