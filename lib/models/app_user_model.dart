import 'package:play_hq/models/other/release_date_model.dart';

class UserModel {
  UserModel({
    this.user,
    this.jwt,
  });

  UserClass? user;
  String? jwt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json["user"] == null ? null : UserClass.fromJson(json["user"]),
        jwt: json["jwt"] == null ? null : json["jwt"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "jwt": jwt == null ? null : jwt,
      };
}

class UserClass {
  UserClass(
      {this.username,
      this.email,
      this.provider,
      this.phoneNumber,
      this.notificationToken,
      this.name,
      this.prefGenres,
      this.prefReleaseDates,
      this.prefPlatforms,
      this.location,
      this.setupDone});

  String? username;
  String? email;
  String? provider;
  dynamic phoneNumber;
  dynamic notificationToken;
  dynamic name;
  List<PrefGenre>? prefGenres;
  List<ReleaseDate>? prefReleaseDates;
  List<PrefPlatform>? prefPlatforms;
  Location? location;
  bool? setupDone;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
      username: json["username"] == null ? null : json["username"],
      email: json["email"] == null ? null : json["email"],
      provider: json["provider"] == null ? null : json["provider"],
      phoneNumber: json["phone_number"],
      notificationToken: json["notification_token"],
      name: json["name"],
      prefGenres: json["pref_genres"] == null
          ? null
          : List<PrefGenre>.from(
              json["pref_genres"].map((x) => PrefGenre.fromJson(x))),
      prefReleaseDates: json["pref_release_dates"] == null
          ? null
          : List<ReleaseDate>.from(
              json["pref_release_dates"].map((x) => ReleaseDate.fromJson(x))),
      prefPlatforms: json["pref_platforms"] == null
          ? null
          : List<PrefPlatform>.from(
              json["pref_platforms"].map((x) => PrefPlatform.fromJson(x))),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      setupDone: json["setupDone"] == null ? false : json["setupDone"]);

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "provider": provider == null ? null : provider,
        "phone_number": phoneNumber,
        "notification_token": notificationToken,
        "name": name,
        "pref_genres": prefGenres == null
            ? null
            : List<dynamic>.from(prefGenres!.map((x) => x.toJson())),
        "pref_release_dates": prefReleaseDates == null
            ? null
            : List<dynamic>.from(prefReleaseDates!.map((x) => x.toJson())),
        "pref_platforms": prefPlatforms == null
            ? null
            : List<dynamic>.from(prefPlatforms!.map((x) => x.toJson())),
        "location": location == null ? null : location!.toJson(),
        "setupDone": setupDone == null ? false : setupDone
      };
}

class Location {
  Location({
    this.id,
    this.lat,
    this.long,
    this.address,
  });

  int? id;
  double? lat;
  double? long;
  String? address;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] == null ? null : json["id"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
        address: json["address"] == null ? null : json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "address": address == null ? null : address,
      };
}

class PrefGenre {
  PrefGenre({
    this.id,
    this.name,
    this.imageBackground,
  });

  int? id;
  String? name;
  String? imageBackground;

  factory PrefGenre.fromJson(Map<String, dynamic> json) => PrefGenre(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        imageBackground:
            json["image_background"] == null ? null : json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image_background": imageBackground == null ? null : imageBackground,
      };
}

class PrefPlatform {
  PrefPlatform({
    this.id,
    this.name,
    this.platformName,
  });

  int? id;
  String? name;
  String? platformName;

  factory PrefPlatform.fromJson(Map<String, dynamic> json) => PrefPlatform(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        platformName:
            json["platform_name"] == null ? null : json["platform_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "platform_name": platformName == null ? null : platformName,
      };
}
