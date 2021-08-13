class GameDetailsModel {
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
  final int? playtime;
  final int? screenshotsCount;
  final int? ratingsCount;
  final int? suggestionsCount;
  final int? gameSeriesCount;
  final int? reviewsCount;
  final List<Platform>? platforms;
  final List<GenreTagPublisher>? genres;
  final List<GenreTagPublisher>? tags;
  final List<GenreTagPublisher>? publishers;
  final String? description;

  const GameDetailsModel({
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
    this.playtime,
    this.screenshotsCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.gameSeriesCount,
    this.reviewsCount,
    this.platforms,
    this.genres,
    this.tags,
    this.publishers,
    this.description
  });

  factory GameDetailsModel.fromJson(Map<String, dynamic> json) =>  GameDetailsModel(
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
    playtime: json["playtime"] ?? 0,
    screenshotsCount: json["screenshots_count"] ?? 0,
    ratingsCount: json["ratings_count"] ?? 0,
    suggestionsCount: json["suggestions_count"] ?? 0,
    gameSeriesCount: json["game_series_count"] ?? 0,
    reviewsCount: json["reviews_count"] ?? 0,
    platforms: json["platforms"] == null ? [] : List<Platform>.from(json["platforms"].map((x) => Platform.fromJson(x))),
    genres: json["genres"] == null ? [] : List<GenreTagPublisher>.from(json["genres"].map((x) => GenreTagPublisher.fromJson(x))),
    tags: json["tags"] == null ? [] : List<GenreTagPublisher>.from(json["tags"].map((x) => GenreTagPublisher.fromJson(x))),
    publishers: json["publishers"] == null ? [] : List<GenreTagPublisher>.from(json["publishers"].map((x) => GenreTagPublisher.fromJson(x))),
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

class GenreTagPublisher {

  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? language;

  const GenreTagPublisher({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.language,
  });

  factory GenreTagPublisher.fromJson(Map<String, dynamic> json) => GenreTagPublisher(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    slug: json["slug"] ?? "",
    gamesCount: json["games_count"] ?? 0,
    language: json["language"] ?? "",
  );
}
