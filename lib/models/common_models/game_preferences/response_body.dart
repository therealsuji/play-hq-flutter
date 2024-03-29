

import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';

import '../metadata_model.dart';

GamePreferancesResponse gamePreferancesResponseFromJson(String str) => GamePreferancesResponse.fromJson(json.decode(str));

class GamePreferancesResponse{

  List<Data> data;
  MetaData metaData;

  GamePreferancesResponse({required this.data, required this.metaData});

  factory GamePreferancesResponse.fromJson(Map<String, dynamic> json) => GamePreferancesResponse(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    metaData: MetaData.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "game": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": metaData.toJson(),
  };
}

class Data{

  Data dataFromJson(String str) => Data.fromJson(json.decode(str));

  Data({
    required this.id,
    required this.game,
    required this.platform
  });

  String id;
  GameModel game;
  int platform;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    game: GameModel.fromJson(json["game"]),
    platform: json["platform"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "game": game.toJson(),
    "platform": platform,
  };
}