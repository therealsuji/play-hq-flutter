

import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';

List<GamePreferances> gamePreferancesFromJson(String str) => List<GamePreferances>.from(json.decode(str).map((x) => GamePreferances.fromJson(x)));

class GamePreferances {
  GamePreferances({
    required this.game,
    required this.platform,
    this.id,
  });

  GameModel game;
  int? id;
  int platform;

  factory GamePreferances.fromJson(Map<String, dynamic> json) => GamePreferances(
    game: GameModel.fromJson(json["game"]),
    platform: json["platform"] == null ? 0 : json["platform"],
    id: json["id"] == null ? 0 : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "game": game.toJson(),
    "platform": platform,
  };
}