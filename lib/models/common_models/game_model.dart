import 'dart:convert';

GameModel userGamesModelFromJson(String str) => GameModel.fromJson(json.decode(str));

class GameModel {
  GameModel({
    this.title,
    this.apiId,
    this.boxCover,
    this.platforms,
    this.genres,
    this.images,
    this.releaseDate,
    this.backgroundImage,
  });

  String? title;
  int? apiId;
  String? boxCover;
  List<dynamic>? platforms;
  List<dynamic>? genres;
  String? releaseDate;
  List<String>? images;
  String? backgroundImage;

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    title: json["title"] == null ? null : json["title"],
    apiId: json["apiId"] == null ? null : json["apiId"],
    boxCover: json["boxCover"] == null ? null : json["boxCover"],
    platforms:json["platforms"] == null ? List.empty() : json['platforms'],
    genres: json["genres"] == null ? List.empty() :json['genres'],
    releaseDate: json["releaseDate"] == null ? null : json["releaseDate"],
    backgroundImage: json["backgroundImage"] == null ? null : json["backgroundImage"],
    images:json["images"] == null ? List.empty() : List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "boxCover": boxCover,
    "releaseDate": releaseDate,
    "backgroundImage": backgroundImage,
    "apiId": apiId,
    "images": List<int>.from(images!.map((x) => x)),
    "platforms": platforms!,
    "genres": genres!,
  };
}

