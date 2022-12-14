class SortDistanceHealthFacilities {
  String? name;
  String? address;
  String? image;
  String? distance;
  int? distanceSort;

  SortDistanceHealthFacilities(
      {this.name, this.address, this.image, this.distance, this.distanceSort});

  SortDistanceHealthFacilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    image = json['image'];
    distance = json['distance'];
    distanceSort = json['distanceSort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['image'] = image;
    data['distance'] = distance;
    data['distanceSort'] = distanceSort;
    return data;
  }
}
