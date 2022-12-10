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
    required this.idHospital,
    required this.sessionName,
    required this.capacity,
    required this.sessionStatus,
    required this.startSession,
    required this.endSession,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        id: json['id'],
        idHospital: json['id_healthfacilities'],
        sessionName: json['session_name'],
        capacity: json['capacity'],
        sessionStatus: json['session_status'],
        startSession: json['start_Session'],
        endSession: json['end_Session'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_healthfacilities': idHospital,
        'session_name': sessionName,
        'capacity': capacity,
        'session_status': sessionStatus,
        'start_session': startSession,
        'end_session': endSession,
      };
}
