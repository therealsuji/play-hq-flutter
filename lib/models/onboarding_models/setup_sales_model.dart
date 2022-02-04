
import 'dart:convert';

import 'package:play_hq/models/common_models/location_model.dart';

SetupSalesModel setupSalesModelFromJson(String str) => SetupSalesModel.fromJson(json.decode(str));

class SetupSalesModel {
  SetupSalesModel({
    this.location,
    this.phoneNumber,
    this.displayName,
    this.fullName,
  });

  LocationModel? location;
  String? phoneNumber;
  String? displayName;
  String? fullName;

  factory SetupSalesModel.fromJson(Map<String, dynamic> json) => SetupSalesModel(
    location: LocationModel.fromJson(json["location"]),
    phoneNumber: json["phone_number"],
    displayName: json["display_name"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "location": location!.toJson(),
    "phone_number": phoneNumber,
    "display_name": displayName,
    "full_name": fullName,
  };

}