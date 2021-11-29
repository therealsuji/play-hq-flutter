

import 'dart:convert';

import 'package:play_hq/models/common_models/user_games_model.dart';

List<WishListGames> wishListGamesFromJson(String str) => List<WishListGames>.from(json.decode(str).map((x) => WishListGames.fromJson(x)));

class WishListGames {
  WishListGames({
    required this.game,
    required this.platform,
  });

  UserGamesModel game;
  int platform;

  factory WishListGames.fromJson(Map<String, dynamic> json) => WishListGames(
    game: UserGamesModel.fromJson(json["game"]),
    platform: json["platform"],
  );
}