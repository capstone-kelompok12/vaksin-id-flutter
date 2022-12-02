class UserModel {
  int? nik;
  String? name;
  String? jenisKelamin;
  String? email;
  String? password;


  UserModel({
    required this.nik,
    required this.name,
    required this.jenisKelamin,
    required this.email,
    required this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    name = json['name'];
    jenisKelamin = json['jenis kelamin'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['username'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
