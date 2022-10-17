import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:play_hq/models/common_models/genres_model.dart';
import 'package:play_hq/models/common_models/rawg_platform_model.dart';

part 'app_search_game_model.g.dart';

SearchGame searchGamefromJson(String str) => SearchGame.fromJson(json.decode(str));

class SearchGame {
  List<GameDetails>? _data;

  SearchGame.fromJson(Map<String, dynamic> json) {
    _data = json['results'] == null
        ? null
        : List<GameDetails>.from(json['results'].map((games) => GameDetails.fromJson(games)));
  }

  List<GameDetails>? get data => _data;
}

GameDetails gameDetailsFromJson(String str) => GameDetails.fromJson(json.decode(str));

class GameDetails {
  String? name;

  String? released;

  String? image;

  int? id;

  List<RawgPlatformModel>? platforms;

  List<Genres>? genres;

  GameDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? null : json['name'];
    released = json['released'] == null ? null : json['released'];
    image = json['background_image'] == null ? null : json['background_image'];
    id = json['id'] == null ? null : json['id'];
    platforms = json['platforms'] == null
        ? []
        : List<RawgPlatformModel>.from(json["platforms"].map((x) => RawgPlatformModel.fromJson(x)));
    genres = json['genres'] == null ? [] : List<Genres>.from(json["genres"].map((x) => Genres.fromJson(x)));
  }

  GameDetails({this.name, this.released, this.image, this.id, this.platforms, this.genres});
}

class PlatformElement {
  PlatformElement({
    this.platform,
  });

  PlatformPlatform? platform;

  factory PlatformElement.fromJson(Map<String, dynamic> json) => PlatformElement(
        platform: PlatformPlatform.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform!.toJson(),
      };
}

class PlatformPlatform {
  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) => PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}
