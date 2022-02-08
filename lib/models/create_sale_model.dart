import 'package:play_hq/models/common_models/game_preferance_model.dart';

import 'common_models/location_model.dart';

class CreateSalePayload {
  double price;
  String remarks;
  bool negotiable;
  LocationModel location;
  List<GamePreferances> games;

  CreateSalePayload({
    required this.price,
    required this.remarks,
    required this.negotiable,
    required this.location,
    required this.games,
  });

  factory CreateSalePayload.fromJson(Map<String, dynamic> json) => new CreateSalePayload(
        price: (json['price'] as num).toDouble(),
        remarks: json["remarks"],
        negotiable: json["negotiable"],
        location: LocationModel.fromJson(json["location"]),
        games: new List<GamePreferances>.from(json["games"].map((x) => GamePreferances.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "remarks": remarks,
        "negotiable": negotiable,
        "location": location.toJson(),
        "game_details": new List<dynamic>.from(games.map((x) => x.toJson())),
      };
}

