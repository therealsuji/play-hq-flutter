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

  // @HiveField(4)
  // List<Genres> genres;

  GameDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? null : json['name'];
    released = json['released'] == null ? null : json['released'];
    image = json['background_image'] == null ? null : json['background_image'];
    id = json['id'] == null ? null : json['id'];
    // genres = json['results'] == null ? null : List<Genres>.from(json['results'].map((games) => Genres.fromJson(games)));
  }

  GameDetails({this.name, this.released, this.image, this.id});
}

class Genres {
  String? _name;

  Genres.fromJson(Map<String, dynamic> json) {
    _name = json['name'] == null ? null : json['name'];
  }

  String? get name => _name;
}
