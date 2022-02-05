import 'dart:convert';

GameModel userGamesModelFromJson(String str) => GameModel.fromJson(json.decode(str));

class GameModel {
  GameModel({
    this.title,
    this.apiId,
    this.boxCover,
    this.platforms,
    this.genres,
    this.releaseDate,
    this.backgroundImage,
  });

  String? title;
  int? apiId;
  String? boxCover;
  List<int>? platforms;
  List<int>? genres;
  String? releaseDate;
  String? backgroundImage;

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    title: json["title"] == null ? null : json["title"],
    apiId: json["api_id"],
    boxCover: json["box_cover"],
    platforms:json["platforms"] == null ? List.empty() : List<int>.from(json["platforms"].map((x) => x)),
    genres: json["genres"] == null ? List.empty() : List<int>.from(json["genres"].map((x) => x)),
    releaseDate: json["release_date"],
    backgroundImage: json["background_image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "box_cover": boxCover,
    "release_date": releaseDate,
    "background_image": backgroundImage,
    "api_id": apiId,
    "platforms": List<int>.from(platforms!.map((x) => x)),
    "genres": List<int>.from(genres!.map((x) => x)),
  };
}

