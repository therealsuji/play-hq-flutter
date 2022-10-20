import 'dart:convert';

import 'package:play_hq/models/common_models/location_model.dart';

UserPreferencesModel userPreferencesModelFromJson(String str) =>
    UserPreferencesModel.fromJson(json.decode(str));

class UserPreferencesModel {
  UserPreferencesModel({
    this.location,
    this.phoneNumber,
    this.displayName,
    this.name,
    this.lastName,
  });

  LocationModel? location;
  String? phoneNumber;
  String? displayName;
  String? name;
  String? lastName;

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) => UserPreferencesModel(
        location: LocationModel.fromJson(json["location"]),
        phoneNumber: json["phoneNumber"],
        displayName: json["displayName"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "location": location!.toJson(),
        "phoneNumber": phoneNumber,
        "displayName": displayName,
        "name": name,
      };
}
