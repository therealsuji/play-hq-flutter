// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

List<OrdersModel> ordersFromJson(String str) => List<OrdersModel>.from(json.decode(str).map((x) => OrdersModel.fromJson(x)));

class OrdersModel {
  OrdersModel({
    this.games,
    this.price,
    this.platform,
    this.type,
    this.status,
    this.dueDate
  });

  List<Game>? games;
  String? price;
  String? platform;
  String? type;
  String? status;
  String? dueDate;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
    price: json["price"],
    platform: json["platform"],
    type: json["type"],
    status: json["status"],
    dueDate: json["due_date"],
  );
}

class Game {
  Game({
    this.id,
    this.name,
    this.releaseDate,
    this.coverImage,
  });

  int? id;
  String? name;
  String? releaseDate;
  String? coverImage;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    id: json["id"],
    name: json["name"],
    releaseDate: json["releaseDate"],
    coverImage: json["coverImage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "releaseDate": releaseDate,
    "coverImage": coverImage,
  };
}
