import 'dart:convert';

import 'package:play_hq/models/other/platform_model.dart';

List<WishListModal> wishListModalFromJson(String str) => List<WishListModal>.from(json.decode(str).map((x) => WishListModal.fromJson(x)));

class WishListModal {
  
  int id;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String title;
  String boxCover;
  int apiId;
  DateTime releaseDate;
  List<Platform> platforms;

  WishListModal({
    required this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    required this.title,
    required this.boxCover,
    required this.apiId,
    required this.releaseDate,
    required this.platforms,
  });

  factory WishListModal.fromJson(Map<String, dynamic> json) => WishListModal(
    id: json["id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    boxCover: json["box_cover"],
    apiId: json["api_id"],
    releaseDate: DateTime.parse(json["release_date"]),
    platforms: List<Platform>.from(json["platforms"].map((x) => Platform.fromJson(x))),
  );
}