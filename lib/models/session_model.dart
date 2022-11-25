class SessionModel {
  String? id;
  String? idHospital;
  String? sessionName;
  String? capacity;
  String? sessionStatus;
  String? startSession;
  String? endSession;

  SessionModel({
    required this.id,
    this.idHospital,
    this.sessionName,
    this.capacity,
    this.sessionStatus,
    this.startSession,
    this.endSession,
  });

  SessionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idHospital = json['id_healthfacilities'];
    sessionName = json['session_name'];
    capacity = json['capacity'];
    sessionStatus = json['session_status'];
    startSession = json['start_Session'];
    endSession = json['end_Session'];

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['id_healthfacilities'] = this.idHospital;
      data['session_name'] = this.sessionName;
      data['capacity'] = this.capacity;
      data['session_status'] = this.sessionStatus;
      data['start_session'] = this.startSession;
      data['end_session'] = this.endSession;
      return data;
    }
  }
}
