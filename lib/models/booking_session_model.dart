class BookingSessionModel {
  String? id;
  String? nikUser;
  String? idSession;
  String? queue;
  String? status;

  BookingSessionModel({
    required this.id,
    required this.nikUser,
    required this.idSession,
    required this.queue,
    required this.status,
  });

  factory BookingSessionModel.fromJson(Map<String, dynamic> json) =>
      BookingSessionModel(
        id: json['id'],
        nikUser: json['nik_user'],
        idSession: json['id_session'],
        queue: json['queue'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nik_user': nikUser,
        'id_session': idSession,
        'queue': queue,
        'status': status,
      };
}
