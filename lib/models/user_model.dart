class UserModel {
  UserModel({
    this.nik,
    this.email,
    this.password,
    this.fullname,
    this.phoneNum,
    this.gender,
    this.vaccineCount,
    this.birthDate,
    this.age,
  });

  String? nik;
  String? email;
  String? password;
  String? fullname;
  String? phoneNum;
  String? gender;
  int? vaccineCount;
  String? birthDate;
  int? age;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nik: json["NIK"],
        email: json["Email"],
        password: json["Password"],
        fullname: json["Fullname"],
        phoneNum: json["PhoneNum"],
        gender: json["Gender"],
        vaccineCount: json["VaccineCount"],
        birthDate: json["BirthDate"],
        age: json["Age"],
      );

  Map<String, dynamic> toJson() => {
        "NIK": nik,
        "Email": email,
        "Password": password,
        "Fullname": fullname,
        "PhoneNum": phoneNum,
        "Gender": gender,
        "VaccineCount": vaccineCount,
        "BirthDate": birthDate,
        "Age": age,
      };
}
