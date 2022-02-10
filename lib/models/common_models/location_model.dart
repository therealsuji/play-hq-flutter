import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

class LocationModel {
  LocationModel({
    this.lat,
    this.long,
    this.address,
    this.id
  });

  int? id;
  double? lat;
  double? long;
  String? address;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    address: json["address"],
    id: json["id"]
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
    "address": address,
  };

}