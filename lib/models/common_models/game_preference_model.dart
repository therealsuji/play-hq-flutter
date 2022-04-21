import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';

List<GamePreferences> gamePreferencesFromJson(String str) => List<GamePreferences>.from(json.decode(str).map((x) => GamePreferences.fromJson(x)));

class GamePreferences {
  GamePreferences({
    required this.game,
    this.platform,
  });

  GameModel game;
  int? platform;

  factory GamePreferences.fromJson(Map<String, dynamic> json) => GamePreferences(
    game: GameModel.fromJson(json["game"]),
    platform: json["platform"],
  );

  Map<String, dynamic> toJson() => {
    "game": game.toJson(),
    "platform": platform,
  };
}
