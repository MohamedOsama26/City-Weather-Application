class AddressModel {
  late double lon;
  late double lat;

  AddressModel({required this.lon, required this.lat});
  AddressModel.fromJson(Map<String, dynamic> map) {
    lat = map['lat'];
    lon = map['lon'];
  }
  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }
}

class AddressPoint {
  final double? lat, lon;
  AddressPoint({this.lon, this.lat});
}
