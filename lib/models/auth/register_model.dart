class RegisterModel {
  String? nik;
  String? email;
  String? password;
  String? fullname;
  String? phonenum;
  String? gender;
  String? birthdate;

  RegisterModel({
    this.nik,
    this.email,
    this.password,
    this.fullname,
    this.phonenum,
    this.gender,
    this.birthdate,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        nik: json['nik'],
        email: json['email'],
        password: json['password'],
        fullname: json['fullname'],
        phonenum: json['phonenum'],
        gender: json['gender'],
        birthdate: json['birthdate'],
      );
  Map<String, dynamic> toJson() => {
        'nik': nik,
        'email': email,
        'password': password,
        'fullname': fullname,
        'phonenum': phonenum,
        'gender': gender,
        'birthdate': birthdate,
      };
}