// To parse this JSON data, do
//
//     final rawgGameDetails = rawgGameDetailsFromJson(jsonString);

import 'dart:convert';

RawgGameDetails rawgGameDetailsFromJson(String str) => RawgGameDetails.fromJson(json.decode(str));

class RawgGameDetails {
  RawgGameDetails({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  String? previous;
  List<GameResults>? results;

  factory RawgGameDetails.fromJson(Map<String, dynamic> json) => RawgGameDetails(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<GameResults>.from(json["results"].map((x) => GameResults.fromJson(x))),
  );

}

class GameResults {
  GameResults({
    this.id,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
  });

  int? id;
  String? name;
  String? released;
  bool? tba;
  String? backgroundImage;
  double? rating;

  factory GameResults.fromJson(Map<String, dynamic> json) => GameResults(
    id: json["id"],
    name: json["name"],
    released: json["released"],
    tba: json["tba"],
    backgroundImage: json["background_image"],
    rating: json["rating"],
  );
}
