
class SalesModel {
  SalesModel({
    this.location,
    this.phoneNumber,
    this.name,
  });

  Location? location;
  String? phoneNumber;
  String? name;

  factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
    location: Location.fromJson(json["location"]),
    phoneNumber: json["phone_number"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "location": location!.toJson(),
    "phone_number": phoneNumber,
    "name": name,
  };
}

class Location {
  Location({
    this.lat,
    this.long,
    this.address,
  });

  int? lat;
  int? long;
  String? address;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
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
