

import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';

import '../metadata_model.dart';

GamePreferancesResponse gamePreferancesResponseFromJson(String str) => GamePreferancesResponse.fromJson(json.decode(str));

class GamePreferancesResponse{

  List<Data> data;
  MetaData metaData;

  GamePreferancesResponse({required this.data, required this.metaData});

  factory GamePreferancesResponse.fromJson(Map<String, dynamic> json) => GamePreferancesResponse(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))).toList(),
    metaData: MetaData.fromJson(json["meta"]),
  );

   Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": metaData.toJson(),
  };

  static List<Data> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Data>((item) => Data.fromJson(item))
          .toList();

  static String encode(List<Data> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => Data.toMap(music))
        .toList(),
  );

}

class Data{

  Data dataFromJson(String str) => Data.fromJson(json.decode(str));

  static Map<String, dynamic> toMap(Data music) => {
    'id': music.id,
    'game': music.game,
    'platform': music.platform,
  };

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