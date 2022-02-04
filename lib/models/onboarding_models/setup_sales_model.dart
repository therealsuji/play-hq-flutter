
import 'dart:convert';

import '../app_user_model.dart';

SetupSalesModel setupSalesModelFromJson(String str) => SetupSalesModel.fromJson(json.decode(str));

class SetupSalesModel {
  SetupSalesModel({
    this.location,
    this.phoneNumber,
    this.displayName,
    this.fullName,
  });

  Location? location;
  String? phoneNumber;
  String? displayName;
  String? fullName;

  factory SetupSalesModel.fromJson(Map<String, dynamic> json) => SetupSalesModel(
    location: Location.fromJson(json["location"]),
    phoneNumber: json["phone_number"],
    displayName: json["display_name"],
    fullName: json["full_name"],
  );
}