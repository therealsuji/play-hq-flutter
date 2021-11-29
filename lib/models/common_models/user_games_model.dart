import 'dart:convert';

UserGamesModel userGamesModelFromJson(String str) => UserGamesModel.fromJson(json.decode(str));

class UserGamesModel {
  UserGamesModel({
    this.required,
    this.title,
    this.apiId,
    this.boxCover,
    this.platforms,
    this.genres,
    this.releaseDate,
    this.backgroundImage,
  });

  String? required;
  String? title;
  int? apiId;
  String? boxCover;
  List<int>? platforms;
  List<int>? genres;
  String? releaseDate;
  String? backgroundImage;

  factory UserGamesModel.fromJson(Map<String, dynamic> json) => UserGamesModel(
    required: json["required"],
    title: json["title"],
    apiId: json["api_id"],
    boxCover: json["box_cover"],
    platforms: List<int>.from(json["platforms"].map((x) => x)),
    genres: List<int>.from(json["genres"].map((x) => x)),
    releaseDate: json["release_date"],
    backgroundImage: json["background_image"],
  );
}

