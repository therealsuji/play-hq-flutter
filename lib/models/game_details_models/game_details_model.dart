import 'dart:convert';

import 'package:play_hq/models/other/platform_model.dart';

GameDetailModel gameDetailsModelFromJson(String str) => GameDetailModel.fromJson(json.decode(str));
class GameDetailModel {
  final int? id;
  final String? slug;
  final String? name;
  final String? nameOriginal;
  final String? released;
  final bool? tba;
  final String? updated;
  final String? backgroundImage;
  final String? backgroundImageAdditional;
  final String? website;
  final double? rating;
  final int? ratingTop;
  final List<Ratings>? ratings;
  final int? reviewsCount;
  final List<Platform>? platforms;
  final List<GenreTagDeveloper>? genres;
  final List<GenreTagDeveloper>? tags;
  final List<GenreTagDeveloper>? developer;
  final String? description;

  const GameDetailModel({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reviewsCount,
    this.platforms,
    this.genres,
    this.tags,
    this.developer,
    this.description
  });

  factory GameDetailModel.fromJson(Map<String, dynamic> json) => GameDetailModel(
    id: json["id"] ?? 0,
    slug: json["slug"] ?? "",
    name: json["name"] ?? "",
    nameOriginal: json["name_original"] ?? "",
    released: json["released"] ?? "",
    tba: json["tba"] ?? false,
    updated: json["updated"] ?? "",
    backgroundImage: json["background_image"] ?? null,
    backgroundImageAdditional: json["background_image_additional"] ?? null,
    website: json["website"] ?? "",
    rating: json["rating"] ?? 0.0,
    ratingTop: json["rating_top"] ?? 0,
    ratings: json["ratings"] == null ? [] : List<Ratings>.from(json["ratings"].map((x) => Ratings.fromJson(x))),
    reviewsCount: json["reviews_count"] ?? 0,
    platforms: json["platforms"] == null ? [] : List<Platform>.from(json["platforms"].map((x) => Platform.fromJson(x))),
    genres: json["genres"] == null ? [] : List<GenreTagDeveloper>.from(json["genres"].map((x) => GenreTagDeveloper.fromJson(x))),
    tags: json["tags"] == null ? [] : List<GenreTagDeveloper>.from(json["tags"].map((x) => GenreTagDeveloper.fromJson(x))),
    developer: json["developers"] == null ? [] : List<GenreTagDeveloper>.from(json["developers"].map((x) => GenreTagDeveloper.fromJson(x))),
    description: json["description_raw"] ?? "",
  );
}

class Ratings {

  final int? id;
  final String? title;
  final int? count;
  final double? percent;

  const Ratings({
    required this.id,
    this.title,
    this.count,
    this.percent,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    count: json["count"] ?? 0,
    percent: json["percent"] ?? 0.0,
  );
}
class GenreTagDeveloper {

  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? language;

  const GenreTagDeveloper({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.language,
  });

  factory GenreTagDeveloper.fromJson(Map<String, dynamic> json) => GenreTagDeveloper(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    slug: json["slug"] ?? "",
    gamesCount: json["games_count"] ?? 0,
    language: json["language"] ?? "",
  );
}
