import 'dart:convert';

import 'package:play_hq/models/common_models/game_model.dart';
import '../common_models/location_model.dart';

SalesPayload salesPayloadFromJson(String str) =>
    SalesPayload.fromJson(json.decode(str));

List<SalesPayload> listSalesPayloadFromJson(String str) =>
    List<SalesPayload>.from(
        json.decode(str)['data'].map((x) => SalesPayload.fromJson((x))));

String salesPayloadToJson(SalesPayload data) => json.encode(data.toJson());

class SalesPayload {
  SalesPayload(
      {this.gameList,
      this.price,
      this.saleId,
      this.platform,
      this.negotiable,
      this.remarks,
      this.location,
      this.createdDate,
      this.finalPrice,
      this.seller});

  String? saleId;
  String? createdDate;
  List<GameElement>? gameList;
  double? price;
  double? finalPrice;
  int? platform;
  bool? negotiable;
  String? remarks;
  LocationModel? location;
  Seller? seller;

  factory SalesPayload.fromJson(Map<String, dynamic> json) => SalesPayload(
      saleId: json["id"],
      createdDate: json["createdAt"],
      gameList: List<GameElement>.from(
          json["list"].map((x) => GameElement.fromJson(x))),
      price: double.parse(json["price"].toString()),
      platform: json["platform"],
      negotiable: json["negotiable"],
      remarks: json["remarks"],
      location: LocationModel.fromJson(json["location"]),
      finalPrice: json["finalPrice"] != null
          ? double.parse(json["finalPrice"].toString())
          : null,
      seller: json['seller'] != null ? Seller.fromJson(json['seller']) : null);

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(gameList!.map((x) => x.toJson())),
        "price": price,
        "platform": platform,
        "negotiable": negotiable,
        "remarks": remarks,
        "location": location!.toJson(),
      };
}

class GameElement {
  GameElement({required this.game, required this.status, this.statusName});

  GameModel game;
  String status;
  String? statusName;

  factory GameElement.fromJson(Map<String, dynamic> json) => GameElement(
        game: GameModel.fromJson(json["game"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "game": game.toJson(),
        "status": status,
      };
}

class Seller {
  Seller(
      {this.avatar,
      this.rating,
      this.id,
      this.displayName,
      this.address,
      this.phoneNumber});

  String? avatar;
  double? rating;
  String? id;
  String? displayName;
  String? address;
  String? phoneNumber;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
      avatar: json["avatar"],
      rating: json["rating"],
      id: json['id'],
      displayName: json['displayName'],
      address: json['adddress'],
      phoneNumber: json['phone']);

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "rating": rating,
        "id": id,
      };
}
