class SearchGame {
  List<GameDetails> _data;

  SearchGame.fromJson(Map<String, dynamic> json) {
    _data = json['results'] == null
        ? null
        : List<GameDetails>.from(json['results'].map((street) => GameDetails.fromJson(street)));
  }

  List<GameDetails> get data => _data;
}

class GameDetails {
  String _name;
  String _released;
  String _image;
  String _id;

  GameDetails.fromJson(Map<String, dynamic> json) {
    _name = json['name'] == null ? null : json['name'];
    _released = json['released'] == null ? null : json['released'];
    _image = json['background_image'] == null ? null : json['background_image'];
    _id = json['id'] == null ? null : json['id'];
  }

  String get image => _image;

  String get released => _released;

  String get name => _name;

  String get id => _id;
}
