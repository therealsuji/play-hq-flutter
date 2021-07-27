

class SetupPurchaseModel{

  List<GenreModel>? _genreList;
  List<ReleaseDatesModel>? _releaseDateList;
  List<PlatformModel>? _platformList;


  SetupPurchaseModel.fromJson(Map<String, dynamic> json) {
    _genreList = json['genres'] == null
        ? null
        : List<GenreModel>.from(json['genres'].map((genres) => GenreModel.fromJson(genres)));

    _releaseDateList = json['releaseDates'] == null
        ? null
        : List<ReleaseDatesModel>.from(json['releaseDates'].map((dates) => ReleaseDatesModel.fromJson(dates)));

    _platformList = json['platforms'] == null
        ? null
        : List<PlatformModel>.from(json['platforms'].map((dates) => PlatformModel.fromJson(dates)));
  }

  List<GenreModel>? get genres => _genreList;

  List<ReleaseDatesModel>? get releaseDates => _releaseDateList;

  List<PlatformModel>? get platforms => _platformList;

}

class GenreModel {

  int? id;
  String? name;

  GenreModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? null : json['name'];
    id = json['api_id'] == null ? null : json['api_id'];
  }

  GenreModel({this.id , this.name});

}

class ReleaseDatesModel {

  String? id;

  ReleaseDatesModel.fromJson(Map<String,dynamic> json){
    id = json['id'] == null ? null : json['id'];
  }

  ReleaseDatesModel({this.id});

}

class PlatformModel{

  int? id;
  String? name;

  PlatformModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? null : json['name'];
    id = json['api_id'] == null ? null : json['api_id'];
  }

  PlatformModel({this.id , this.name});

}