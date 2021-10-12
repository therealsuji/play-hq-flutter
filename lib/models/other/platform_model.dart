class Platform {
  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;

  const Platform({
    required this.id,
    this.name,
    this.slug,
    this.gamesCount,
  });

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["platform"]["id"] ?? 0,
    name: json["platform"]["name"] ?? "",
    slug: json["platform"]["slug"] ?? "",
    gamesCount: json["platform"]["games_count"] ?? 0,
  );
}
