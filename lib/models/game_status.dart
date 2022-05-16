import 'dart:convert';

GameStatus gameStatusFromJson(String str) => GameStatus.fromJson(json.decode(str));

String gameStatusToJson(GameStatus data) => json.encode(data.toJson());

class GameStatus {
  GameStatus({
    required this.wishList,
    required this.gameLibrary,
  });

  bool wishList;
  bool gameLibrary;

  factory GameStatus.fromJson(Map<String, dynamic> json) => GameStatus(
    wishList: json["wishList"],
    gameLibrary: json["gameLibrary"],
  );

  Map<String, dynamic> toJson() => {
    "wishList": wishList,
    "gameLibrary": gameLibrary,
  };
}
