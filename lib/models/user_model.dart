class UserModel {
  int? nik;
  String? name;
  String? birthday;
  String? gender;
  String? email;
  String? password;
  String? confirmPassword;
  Map<String, dynamic>? profile;

  UserModel({
    this.nik,
    this.name,
    this.birthday,
    this.gender,
    this.email,
    this.password,
    this.confirmPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nik: json['nik'],
        name: json['name'],
        birthday: json['date_birthday'],
        gender: json['gender'],
        email: json['email'],
        password: json['password'],
        confirmPassword: json['confirm_password'],
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "name": name,
        "date_birthday": birthday,
        "gender": gender,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
