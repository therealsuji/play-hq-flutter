import 'dart:convert';

class UserModel {
  User user;
  String jwt;

  UserModel({
    this.user,
    this.jwt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
        user: User.fromJson(json["user"]),
        jwt: json["jwt"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "jwt": jwt,
      };
}

class User {
  int id;
  String username;
  String email;
  dynamic provider;
  bool confirmed;
  dynamic blocked;
  Role role;
  dynamic phoneNumber;
  String createdAt;
  String updatedAt;
  List<Genre> genres;
  List<dynamic> releaseDates;
  List<dynamic> platforms;
  Location location;

  User({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.role,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.genres,
    this.releaseDates,
    this.platforms,
    this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        role: Role.fromJson(json["role"]),
        phoneNumber: json["phoneNumber"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        genres: new List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        releaseDates: new List<dynamic>.from(json["releaseDates"].map((x) => x)),
        platforms: new List<dynamic>.from(json["platforms"].map((x) => x)),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "role": role.toJson(),
        "phoneNumber": phoneNumber,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "genres": new List<dynamic>.from(genres.map((x) => x.toJson())),
        "releaseDates": new List<dynamic>.from(releaseDates.map((x) => x)),
        "platforms": new List<dynamic>.from(platforms.map((x) => x)),
        "location": location.toJson(),
      };
}

class Genre {
  int id;
  String name;
  int apiId;

  Genre({
    this.id,
    this.name,
    this.apiId,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
        id: json["id"],
        name: json["name"],
        apiId: json["api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "api_id": apiId,
      };
}

class Location {
  int id;
  int lat;
  int long;

  Location({
    this.id,
    this.lat,
    this.long,
  });

  factory Location.fromJson(Map<String, dynamic> json) => new Location(
        id: json["id"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "long": long,
      };
}

class Role {
  int id;
  String name;
  String description;
  String type;

  Role({
    this.id,
    this.name,
    this.description,
    this.type,
  });

  factory Role.fromJson(Map<String, dynamic> json) => new Role(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
      };
}
