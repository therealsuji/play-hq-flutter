import 'package:hive/hive.dart';

class SearchGame {
  List<GameDetails> _data;

  SearchGame.fromJson(Map<String, dynamic> json) {
    _data = json['results'] == null
        ? null
        : List<GameDetails>.from(json['results'].map((street) => GameDetails.fromJson(street)));
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

  GameDetails.fromJson(Map<String, dynamic> json) {
    _name = json['name'] == null ? null : json['name'];
    _released = json['released'] == null ? null : json['released'];
    _image = json['background_image'] == null ? null : json['background_image'];
    _id = json['id'] == null ? null : json['id'];
  }

  String get image => _image;

  String get released => _released;

  String get name => _name;

  int get id => _id;
}
