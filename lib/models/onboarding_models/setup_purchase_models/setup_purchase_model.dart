import 'dart:convert';

import 'package:play_hq/models/common_models/release_date_model.dart';



SetupPurchaseModel setupPurchaseModelFromJson(String str) => SetupPurchaseModel.fromJson(json.decode(str));

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

}