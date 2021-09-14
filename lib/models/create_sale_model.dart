class CreateSalePayload {
  double price;
  String remarks;
  String? status;
  bool negotiable;
  Location location;
  List<SaleGame> games;

  CreateSalePayload({
    required this.price,
    required this.remarks,
    this.status,
    required this.negotiable,
    required this.location,
    required this.games,
  });

  factory CreateSalePayload.fromJson(Map<String, dynamic> json) => new CreateSalePayload(
        price: (json['price'] as num).toDouble(),
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
  int id;
  String gameCondition;
  String boxImage;
  String title;
  Platform? platform;

  SaleGame({
    required this.id,
    required this.gameCondition,
    required this.boxImage,
    required this.title,
    required this.platform,
  });

  factory SaleGame.fromJson(Map<String, dynamic> json) => new SaleGame(
        id: json["id"],
        gameCondition: json["game_condition"],
        boxImage: json["box_image"],
        title: json["title"],
        platform: (json['platform'] as Map).isEmpty ? null : Platform.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_condition": gameCondition,
        "box_image": boxImage,
        "title": title,
        "platform": platform!.toJson(),
      };
}

class Platform {
  int id;

  Platform({
    required this.id,
  });

  factory Platform.fromJson(Map<String, dynamic> json) => new Platform(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Location {
  int lat;
  int long;
  String address;

  Location({
    required this.lat,
    required this.long,
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) => new Location(
        lat: json["lat"],
        long: json["long"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
        "address": address,
      };
}
