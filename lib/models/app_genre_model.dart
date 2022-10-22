import 'dart:convert';

import 'package:flutter/material.dart';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));

String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
  int? id;
  String? name;
  String? imageBackground;
  Gradient? gradient;

  Genre({this.id, this.name, this.imageBackground, this.gradient});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        imageBackground: json["platform_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageBackground": imageBackground,
      };
}
