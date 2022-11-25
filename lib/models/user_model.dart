class UserModel {
  int? nik;
  String? username;
  String? password;
  String? email;
  String? fullname;
  String? phoneNum;
  int? vachineCount;
  DateTime? birthDate;

  UserModel({
    required this.nik,
    required this.username,
    required this.password,
    required this.email,
    required this.fullname,
    required this.phoneNum,
    this.vachineCount,
    this.birthDate,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    fullname = json['fullname'];
    phoneNum = json['phone_num'];
    vachineCount = json['vachine_count'];
    birthDate = json['birth_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['phone_num'] = this.phoneNum;
    data['vachine_count'] = this.vachineCount;
    data['birth_date'] = this.birthDate;
    return data;
  }
}
