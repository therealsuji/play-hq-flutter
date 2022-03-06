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
  List<Result>? results;

  factory RawgGameDetails.fromJson(Map<String, dynamic> json) => RawgGameDetails(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

}

class Result {
  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    released: json["released"],
    tba: json["tba"],
    backgroundImage: json["background_image"],
    rating: json["rating"],
  );
}
