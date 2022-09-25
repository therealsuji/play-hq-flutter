import 'dart:convert';

import 'package:play_hq/models/app_genre_model.dart';
import 'package:play_hq/models/common_models/platform_model.dart';
import 'package:play_hq/models/common_models/release_date_model.dart';

UserGamePreferences userGameListsFromJson(String str) => UserGamePreferences.fromJson(json.decode(str));

class UserGamePreferences {
  List<Genre> genres;
  List<ReleaseDate> releaseDates;
  List<Platform> platforms;

  UserGamePreferences({required this.genres, required this.releaseDates, required this.platforms});

  factory UserGamePreferences.fromJson(Map<String, dynamic> json) => UserGamePreferences(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        releaseDates: List<ReleaseDate>.from(json["releaseDates"].map((x) => ReleaseDate.fromJson(x))),
        platforms: List<Platform>.from(json["platforms"].map((x) => Platform.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((e) => e.toJson())),
        "releaseDates": List<dynamic>.from(releaseDates.map((e) => e.toJson())),
        "platforms": List<dynamic>.from(platforms.map((e) => e.toJson())),
      };
}

// This is only used to sending the game preferences
UserGamePreferencesPayLoad userGameListsPayLoadFromJson(String str) =>
    UserGamePreferencesPayLoad.fromJson(json.decode(str));

class UserGamePreferencesPayLoad {
  List<int>? genres;
  List<ReleaseDate>? releaseDates;
  List<int>? platforms;

  UserGamePreferencesPayLoad({this.genres, this.releaseDates, this.platforms});

  factory UserGamePreferencesPayLoad.fromJson(Map<String, dynamic> json) => UserGamePreferencesPayLoad(
        genres: List<int>.from(json["genres"].map((x) => x)),
        releaseDates: List<ReleaseDate>.from(json["release_dates"].map((x) => ReleaseDate.fromJson(x))),
        platforms: List<int>.from(json["platforms"].map((x) => x)),
      );
}
