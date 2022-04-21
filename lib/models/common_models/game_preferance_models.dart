

import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';

List<FakePreferances> gamePreferancesFromJson(String str) => List<FakePreferances>.from(json.decode(str).map((x) => FakePreferances.fromJson(x)));

class FakePreferances {
  FakePreferances({
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

  factory FakePreferances.fromJson(Map<String, dynamic> json) => FakePreferances(
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