

import 'dart:convert';

WishListGames wishListGamesModelFromJson(String str) => WishListGames.fromJson(json.decode(str));

class WishListGames {
  List<WishListGameDetails>? gameList;

  WishListGames({this.gameList});

  factory WishListGames.fromJson(Map<String, dynamic> json) => WishListGames(
    gameList: List<WishListGameDetails>.from(json["list"].map((x) => WishListGameDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(gameList!.map((x) => x.toJson())),
  };
}

class WishListGameDetails {

  String? gameTitle;
  String? boxCover;
  String? releaseDate;
  int? id;
  List<int>? platforms;

  WishListGameDetails({this.gameTitle , this.boxCover , this.releaseDate , this.id ,  this.platforms});

  factory WishListGameDetails.fromJson(Map<String, dynamic> json) => WishListGameDetails(
    gameTitle: json["title"],
    boxCover: json["box_cover"],
    releaseDate: json["release_date"],
    id: json["api_id"],
    platforms: List<int>.from(json["platforms"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": gameTitle,
    "box_cover": boxCover,
    "release_date": releaseDate,
    "api_id": id,
    "platforms": List<dynamic>.from(platforms!.map((x) => x)),
  };

}