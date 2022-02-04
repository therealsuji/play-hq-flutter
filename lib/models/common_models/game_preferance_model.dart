

import 'dart:convert';

import 'package:play_hq/models/common_models/user_games_model.dart';

List<GamePreferances> wishListGamesFromJson(String str) => List<GamePreferances>.from(json.decode(str).map((x) => GamePreferances.fromJson(x)));

class GamePreferances {
  GamePreferances({
    required this.game,
    required this.platform,
  });

  GameModel game;
  int platform;

  factory GamePreferances.fromJson(Map<String, dynamic> json) => GamePreferances(
    game: GameModel.fromJson(json["game"]),
    platform: json["platform"],
  );

  Map<String, dynamic> toJson() => {
    "game": game.toJson(),
    "platform": platform,
  };
}