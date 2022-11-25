class HealthFacilitiesModel {
  String? id;
  String? idHospital;

  // HealthFacilities
  String? email;
  String? password;
  String? phoneNum;
  String? name;

  // Sessions
  String? sessionName;
  String? capacity;
  String? sessionStatus;
  String? startSession;
  String? endSession;

  // Vaccines
  String? vacchineName;
  String? stock;

  HealthFacilitiesModel({
    required this.id,
    this.idHospital,

    // HealthFacilities
    this.email,
    this.password,
    this.phoneNum,
    this.name,

    // Seesions
    this.sessionName,
    this.capacity,
    this.sessionStatus,
    this.startSession,
    this.endSession,

    // Vaccines
    this.vacchineName,
    this.stock,
  });

  HealthFacilitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idHospital = json['id_healthfacilities'];

    // HealthFacilities
    email = json['email'];
    password = json['password'];
    phoneNum = json['phone_num'];
    name = json['name'];

    // Sessions
    sessionName = json['session_name'];
    capacity = json['capacity'];
    sessionStatus = json['session_status'];
    startSession = json['start_Session'];
    endSession = json['end_Session'];

    // Vaccines
    vacchineName = json['name'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_healthfacilities'] = this.idHospital;

    // HealthFacilities
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_num'] = this.phoneNum;
    data['name'] = this.name;

    // Sessions
    data['session_name'] = this.sessionName;
    data['capacity'] = this.capacity;
    data['session_status'] = this.sessionStatus;
    data['start_session'] = this.startSession;
    data['end_session'] = this.endSession;

    // Vaccines
    data['name'] = this.vacchineName;
    data['stock'] = this.stock;

    return data;
  }
}
