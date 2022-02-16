

import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';

List<GamePreferances> gamePreferancesFromJson(String str) => List<GamePreferances>.from(json.decode(str).map((x) => GamePreferances.fromJson(x)));

class GamePreferances {
  GamePreferances({
    required this.game,
    this.platform,
    this.id,
    this.conditionId,
    this.conditionName,
  });

  GameModel game;
  int? id;
  int? platform;
  String? conditionId;
  String? conditionName;

  factory GamePreferances.fromJson(Map<String, dynamic> json) => GamePreferances(
    game: GameModel.fromJson(json["game"]),
    platform: json["platform"] == null ? 0 : json["platform"],
    id: json["id"] == null ? 0 : json["id"],
    conditionId: json["condition"] == null ? '' : json["condition"],
  );

  Map<String, dynamic> toJson() => {
    "game": game.toJson(),
    "platform": platform.toString(),
    "condition": conditionName,
  };
}