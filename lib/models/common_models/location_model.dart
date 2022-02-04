import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

class LocationModel {
  LocationModel({
    this.lat,
    this.long,
    this.address,
  });

  double? lat;
  double? long;
  String? address;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    address: json["address"],
  );

}