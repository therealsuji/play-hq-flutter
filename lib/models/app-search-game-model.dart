import 'package:hive/hive.dart';

class SearchGame {
  List<GameDetails> _data;

  SearchGame.fromJson(Map<String, dynamic> json) {
    _data = json['results'] == null
        ? null
        : List<GameDetails>.from(json['results'].map((games) => GameDetails.fromJson(games)));
  }

  List<GameDetails> get data => _data;
}

@HiveType(typeId: 0)
class GameDetails extends HiveObject{

  @HiveField(0)
  String _name;

  @HiveField(1)
  String _released;

  @HiveField(2)
  String _image;
  
  @HiveField(3)
  int _id;

  @HiveField(4)
  List<Genres> _genres;


  GameDetails.fromJson(Map<String, dynamic> json) {
    _name = json['name'] == null ? null : json['name'];
    _released = json['released'] == null ? null : json['released'];
    _image = json['background_image'] == null ? null : json['background_image'];
    _id = json['id'] == null ? null : json['id'];
    _genres = json['results'] == null ? null : List<Genres>.from(json['results'].map((games) => Genres.fromJson(games)));
  }

  String get image => _image;

  String get released => _released;

  String get name => _name;

  int get id => _id;

  List<Genres> get genres => _genres;
}

class Genres{

  String _name;

  Genres.fromJson(Map<String , dynamic> json){
    _name = json['name'] == null ? null : json['name'];
  }

  String get name => _name;

}
