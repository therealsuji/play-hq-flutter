import 'package:hive/hive.dart';

part 'app_search_game_model.g.dart';

class SearchGame {
  List<GameDetails>? _data;

  SearchGame.fromJson(Map<String, dynamic> json) {
    _data = json['results'] == null
        ? null
        : List<GameDetails>.from(json['results'].map((games) => GameDetails.fromJson(games)));
  }

  List<GameDetails>? get data => _data;
}

@HiveType(typeId: 0)
class GameDetails extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? released;

  @HiveField(2)
  String? image;

  @HiveField(3)
  int? id;

  @HiveField(4)
  List<PlatformElement>? platforms;

  GameDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? null : json['name'];
    released = json['released'] == null ? null : json['released'];
    image = json['background_image'] == null ? null : json['background_image'];
    id = json['id'] == null ? null : json['id'];
    platforms = List<PlatformElement>.from(json["platforms"].map((x) => PlatformElement.fromJson(x)));
  }

  GameDetails({this.name, this.released, this.image, this.id , this.platforms});
}

class Genres {
  String? _name;

  Genres.fromJson(Map<String, dynamic> json) {
    _name = json['name'] == null ? null : json['name'];
  }

  String? get name => _name;
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

