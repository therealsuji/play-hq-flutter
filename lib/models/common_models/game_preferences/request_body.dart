import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';

List<GamePreferencesRequest> gamePreferencesFromJson(String str) => List<GamePreferencesRequest>.from(json.decode(str).map((x) => GamePreferencesRequest.fromJson(x)));

class GamePreferencesRequest {
  GamePreferencesRequest({
    required this.game,
    this.platform,
  });

  GameModel game;
  int? platform;

  factory GamePreferencesRequest.fromJson(Map<String, dynamic> json) => GamePreferencesRequest(
    game: GameModel.fromJson(json["game"]),
    platform: json["platform"],
  );

  Map<String, dynamic> toJson() => {
    "game": game.toJson(),
    "platform": platform,
  };
}
