class BookingSessionModel {
  String? id;
  String? nikUser;
  String? idSession;
  String? queue;
  String? status;

  BookingSessionModel({
    required this.id,
    this.nikUser,
    this.idSession,
    this.queue,
    this.status,
  });

  BookingSessionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nikUser = json['nik_user'];
    idSession = json['id_session'];
    queue = json['queue'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nik_user'] = this.nikUser;
    data['id_session'] = this.idSession;
    data['queue'] = this.queue;
    data['status'] = this.status;

    return data;
  }
}
