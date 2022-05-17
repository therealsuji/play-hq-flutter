import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';
import '../common_models/location_model.dart';


import 'dart:convert';

SalesPayload salesPayloadFromJson(String str) => SalesPayload.fromJson(json.decode(str));

String salesPayloadToJson(SalesPayload data) => json.encode(data.toJson());

class SalesPayload {
  SalesPayload({
    this.gameElement,
    this.price,
    this.platform,
    this.negotiable,
    this.remarks,
    this.location,
  });


  List<GameElement>? gameElement;
  int? price;
  int? platform;
  bool? negotiable;
  String? remarks;
  LocationModel? location;

  factory SalesPayload.fromJson(Map<String, dynamic> json) => SalesPayload(
    gameElement: List<GameElement>.from(json["list"].map((x) => GameElement.fromJson(x))),
    price: json["price"],
    platform: json["platform"],
    negotiable: json["negotiable"],
    remarks: json["remarks"],
    location: LocationModel.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(gameElement!.map((x) => x.toJson())),
    "price": price,
    "platform": platform,
    "negotiable": negotiable,
    "remarks": remarks,
    "location": location!.toJson(),
  };
}

class GameElement {
  GameElement({
    this.game,
    this.status,
    this.statusName
  });

  GameModel? game;
  String? status;
  String? statusName;

  factory GameElement.fromJson(Map<String, dynamic> json) => GameElement(
    game: GameModel.fromJson(json["game"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "game": game!.toJson(),
    "status": status,
  };
}

