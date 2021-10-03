class SetupPurchaseModel {
  List<int>? genres;
  List<ReleaseDate>? releaseDates;
  List<int>? platforms;

  SetupPurchaseModel({this.genres, this.releaseDates, this.platforms});

  factory SetupPurchaseModel.fromJson(Map<String, dynamic> json) => SetupPurchaseModel(
    genres: List<int>.from(json["genres"].map((x) => x)),
    releaseDates: List<ReleaseDate>.from(json["release_dates"].map((x) => ReleaseDate.fromJson(x))),
    platforms: List<int>.from(json["platforms"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "genres": List<dynamic>.from(genres!.map((x) => x)),
    "release_dates": List<dynamic>.from(releaseDates!.map((x) => x.toJson())),
    "platforms": List<dynamic>.from(platforms!.map((x) => x)),
  };

}

class ReleaseDate {
  ReleaseDate({
    this.fromDate,
    this.toDate,
  });

  String? fromDate;
  String? toDate;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
    fromDate: json["from_date"],
    toDate: json["to_date"],
  );

  Map<String, dynamic> toJson() => {
    "from_date": fromDate,
    "to_date": toDate,
  };
}