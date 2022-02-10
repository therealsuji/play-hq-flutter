import 'dart:convert';

import 'package:play_hq/models/common_models/game_preferance_model.dart';

import '../common_models/location_model.dart';


List<SalesPayload> salesModelFromJson(String str) => List<SalesPayload>.from(json.decode(str).map((x) => SalesPayload.fromJson(x)));

class SalesPayload {
  int? id;
  double price;
  String? remarks;
  bool negotiable;
  LocationModel location;
  List<GamePreferances> games;

  SalesPayload({
    this.id,
    required this.price,
    this.remarks,
    required this.negotiable,
    required this.location,
    required this.games,
  });

  factory SalesPayload.fromJson(Map<String, dynamic> json) => new SalesPayload(
        id: json["id"],
        price: (json['price'] as num).toDouble(),
        remarks: json["remarks"],
        negotiable: json["negotiable"],
        location: LocationModel.fromJson(json["location"]),
        games: new List<GamePreferances>.from(json["games"].map((x) => GamePreferances.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "remarks": remarks,
        "negotiable": negotiable,
        "location": location.toJson(),
        "game_details": new List<dynamic>.from(games.map((x) => x.toJson())),
      };
}

