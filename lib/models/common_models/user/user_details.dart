import 'dart:convert';

import 'package:play_hq/models/common_models/location_model.dart';

UserDetails userDetailsfromJson(String str) => UserDetails.fromJson(json.decode(str));
List<UserDetails> listUserDetailsFromJson(String str) =>
    List<UserDetails>.from(json.decode(str)['data'].map((x) => UserDetails.fromJson((x))));

class UserDetails {
  UserDetails({
    this.name,
    this.role,
    this.email,
    this.avatar,
    this.phone,
    this.isSetupDone,
    this.location,
    this.displayName,
  });

  String? name;
  String? role;
  String? email;
  String? avatar;
  String? phone;
  bool? isSetupDone;
  LocationModel? location;
  String? displayName;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: json["name"] == null ? "" : json["name"],
        role: json["role"] == null ? "" : json["role"],
        email: json["email"] == null ? "" : json["email"],
        avatar: json["avatar"] == null ? "" : json["avatar"],
        phone: json["phone"] == null ? "" : json["phone"],
        isSetupDone: json["isSetupDone"] == null ? false : json["isSetupDone"],
        location: json['location'] == null ? null : LocationModel.fromJson(json['location']),
        displayName: json["displayName"] == null ? "" : json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "email": email,
        "avatar": avatar,
        "phone": phone,
        "isSetupDone": isSetupDone,
        "location": location,
        "displayName": displayName,
      };
}
