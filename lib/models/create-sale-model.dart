import 'dart:convert';

class CreateSalePayload {
  int price;
  String remarks;
  String status;
  bool negotiable;
  Location location;
  List<SaleGame> games;

  CreateSalePayload({
    this.price,
    this.remarks,
    this.status,
    this.negotiable,
    this.location,
    this.games,
  });

  factory CreateSalePayload.fromJson(Map<String, dynamic> json) => new CreateSalePayload(
        price: json["price"],
        remarks: json["remarks"],
        status: json["status"],
        negotiable: json["negotiable"],
        location: Location.fromJson(json["location"]),
        games: new List<SaleGame>.from(json["games"].map((x) => SaleGame.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "remarks": remarks,
        "status": status,
        "negotiable": negotiable,
        "location": location.toJson(),
        "games": new List<dynamic>.from(games.map((x) => x.toJson())),
      };
}

class SaleGame {
  String id;
  String gameCondition;
  String boxImage;
  Platform platform;
  String title;

  SaleGame({
    this.id,
    this.gameCondition,
    this.boxImage,
    this.platform,
    this.title,
  });

  factory SaleGame.fromJson(Map<String, dynamic> json) => new SaleGame(
        id: json["id"],
        gameCondition: json["gameCondition"],
        boxImage: json["box_image"],
        platform: Platform.fromJson(json["platform"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gameCondition": gameCondition,
        "box_image": boxImage,
        "platform": platform.toJson(),
        "title": title,
      };
}

class Platform {
  String id;
  int apiId;
  String name;

  Platform({
    this.id,
    this.apiId,
    this.name,
  });

  factory Platform.fromJson(Map<String, dynamic> json) => new Platform(
        id: json["id"],
        apiId: json["api_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "api_id": apiId,
        "name": name,
      };
}

class Location {
  String id;
  int lat;
  int long;
  String address;

  Location({
    this.id,
    this.lat,
    this.long,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) => new Location(
        id: json["id"],
        lat: json["lat"],
        long: json["long"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "long": long,
        "address": address,
      };
}
