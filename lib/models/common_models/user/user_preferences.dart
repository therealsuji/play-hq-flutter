import 'dart:convert';

import 'package:play_hq/models/common_models/location_model.dart';

UserPreferencesModel userPreferencesModelFromJson(String str) => UserPreferencesModel.fromJson(json.decode(str));

class UserPreferencesModel {
  UserPreferencesModel({
    this.location,
    this.phoneNumber,
    this.displayName,
    this.firstName,
    this.lastName,
  });

  LocationModel? location;
  String? phoneNumber;
  String? displayName;
  String? firstName;
  String? lastName;

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) => UserPreferencesModel(
        location: LocationModel.fromJson(json["location"]),
        phoneNumber: json["phoneNumber"],
        displayName: json["displayName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "location": location!.toJson(),
        "phoneNumber": phoneNumber,
        "displayName": displayName,
        "firstName": firstName,
        "lastName": lastName,
      };
}
