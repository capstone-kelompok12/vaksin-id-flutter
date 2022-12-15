class PenerimaVaksinModel {
  PenerimaVaksinModel({
    this.nik,
    this.nama,
    this.idSession,
  });

  String? nik;
  String? nama;
  String? idSession;

  factory PenerimaVaksinModel.fromJson(Map<String, dynamic> json) =>
      PenerimaVaksinModel(
        nik: json["NIK"],
        nama: json["Fullname"],
        idSession: json["id_session"],
      );

  Map<String, dynamic> toJson() => {
        "NIK": nik,
        "Fullname": nama,
        "id_session": idSession,
      };
}
