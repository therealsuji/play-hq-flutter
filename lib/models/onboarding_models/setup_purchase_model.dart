class SetupPurchaseModel {
  List<int>? genreList;
  List<ReleaseDates>? releaseDateList;
  List<int>? platformList;

  SetupPurchaseModel({this.genreList, this.releaseDateList, this.platformList});

  SetupPurchaseModel.fromJson(Map<String, dynamic> json) {
    genreList = json['genres'] == null ? null : List<int>.from(json['genres']);

    releaseDateList = json['releaseDates'] == null
        ? null
        : List<ReleaseDates>.from(
            json['releaseDates'].map((x) => ReleaseDates.fromJson(x)));

    platformList =
        json['platforms'] == null ? null : List<int>.from(json['platforms']);
  }

  List<int>? get genres => genreList;

  List<ReleaseDates>? get releaseDates => releaseDateList;

  List<int>? get platforms => platformList;
}

class ReleaseDates {
  String? start_date;
  String? end_date;

  ReleaseDates({this.start_date, this.end_date});

  ReleaseDates.fromJson(Map<String, dynamic> json) {
    start_date = json['from_date'] ?? "";
    end_date = json['to_date'] ?? "";
  }

  String? get start_Date => start_date;

  String? get end_Date => end_date;
}
