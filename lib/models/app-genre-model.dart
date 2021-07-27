class ListGenreModel{
  List<GenreModel> _genreList = [];

  ListGenreModel.fromJson(Map<String, dynamic> json){
    json['results'].forEach((genre) {
      _genreList.add(GenreModel(genre));
    });
  }

  List<GenreModel> get list => _genreList;
}

class GenreModel {

  int? id;
  String? name;
  String? imageBackground;

  GenreModel(key) {
    id = key["id"];
    name = key["name"];
    imageBackground = key["image_background"];
  }
}
