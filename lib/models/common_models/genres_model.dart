import 'dart:convert';

List<Genres> genresFromJson(String str) => List<Genres>.from(json.decode(str).map((x) => Genres.fromJson(x)));
class Genres {
  Genres({
    required this.id,
    required this.name,
    this.slug,
  });

  int id;
  String name;
  String? slug;

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
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