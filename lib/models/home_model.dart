class HealthFacilities {
  bool? success;
  String? message;
  int? countTotal;
  List<Data>? data;

  HealthFacilities({this.success, this.message, this.countTotal, this.data});

  HealthFacilities.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    countTotal = json['count_total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['count_total'] = countTotal;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? kode;
  String? nama;
  String? kota;
  String? provinsi;
  String? alamat;
  String? latitude;
  String? longitude;
  String? telp;
  String? jenisFaskes;
  String? kelasRs;
  String? status;
  List<Detail>? detail;
  String? sourceData;

  Data(
      {this.id,
      this.kode,
      this.nama,
      this.kota,
      this.provinsi,
      this.alamat,
      this.latitude,
      this.longitude,
      this.telp,
      this.jenisFaskes,
      this.kelasRs,
      this.status,
      this.detail,
      this.sourceData});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kode = json['kode'];
    nama = json['nama'];
    kota = json['kota'];
    provinsi = json['provinsi'];
    alamat = json['alamat'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    telp = json['telp'];
    jenisFaskes = json['jenis_faskes'];
    kelasRs = json['kelas_rs'];
    status = json['status'];
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(Detail.fromJson(v));
      });
    }
    sourceData = json['source_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kode'] = kode;
    data['nama'] = nama;
    data['kota'] = kota;
    data['provinsi'] = provinsi;
    data['alamat'] = alamat;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['telp'] = telp;
    data['jenis_faskes'] = jenisFaskes;
    data['kelas_rs'] = kelasRs;
    data['status'] = status;
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    data['source_data'] = sourceData;
    return data;
  }
}

class Detail {
  int? id;
  String? kode;
  String? batch;
  int? divaksin;
  int? divaksin1;
  int? divaksin2;
  int? batalVaksin;
  int? batalVaksin1;
  int? batalVaksin2;
  int? pendingVaksin;
  int? pendingVaksin1;
  int? pendingVaksin2;
  String? tanggal;

  Detail(
      {this.id,
      this.kode,
      this.batch,
      this.divaksin,
      this.divaksin1,
      this.divaksin2,
      this.batalVaksin,
      this.batalVaksin1,
      this.batalVaksin2,
      this.pendingVaksin,
      this.pendingVaksin1,
      this.pendingVaksin2,
      this.tanggal});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kode = json['kode'];
    batch = json['batch'];
    divaksin = json['divaksin'];
    divaksin1 = json['divaksin_1'];
    divaksin2 = json['divaksin_2'];
    batalVaksin = json['batal_vaksin'];
    batalVaksin1 = json['batal_vaksin_1'];
    batalVaksin2 = json['batal_vaksin_2'];
    pendingVaksin = json['pending_vaksin'];
    pendingVaksin1 = json['pending_vaksin_1'];
    pendingVaksin2 = json['pending_vaksin_2'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kode'] = kode;
    data['batch'] = batch;
    data['divaksin'] = divaksin;
    data['divaksin_1'] = divaksin1;
    data['divaksin_2'] = divaksin2;
    data['batal_vaksin'] = batalVaksin;
    data['batal_vaksin_1'] = batalVaksin1;
    data['batal_vaksin_2'] = batalVaksin2;
    data['pending_vaksin'] = pendingVaksin;
    data['pending_vaksin_1'] = pendingVaksin1;
    data['pending_vaksin_2'] = pendingVaksin2;
    data['tanggal'] = tanggal;
    return data;
  }
}
