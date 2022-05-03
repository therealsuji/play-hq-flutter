import 'dart:convert';

import 'package:play_hq/models/common_models/game_preferance_models.dart';

import '../common_models/location_model.dart';


List<SalesPayload> salesModelFromJson(String str) => List<SalesPayload>.from(json.decode(str).map((x) => SalesPayload.fromJson(x)));

class SalesPayload {
  int? id;
  double price;
  String? remarks;
  bool negotiable;
  LocationModel location;
  List<FakePreferances> games;

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
        games: json['games'] == null ? List<FakePreferances>.from(json["game_details"].map((x) => FakePreferances.fromJson(x))) : List<FakePreferances>.from(json["games"].map((x) => FakePreferances.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "remarks": remarks,
        "negotiable": negotiable,
        "location": location.toJson(),
        "game_details": new List<dynamic>.from(games.map((x) => x.toJson())),
      };
}

