
import 'dart:convert';

UserDetails userDetailsfromJson(String str) => UserDetails.fromJson(json.decode(str));

class UserDetails{
  UserDetails({
    this.firstName,
    this.lastName,
    this.role,
    this.email,
    this.avatar,
    this.phone,
    this.isSetupDone,
    this.location,
    this.displayName,
  });

  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? avatar;
  String? phone;
  bool? isSetupDone;
  dynamic location;
  String? displayName;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    firstName: json["firstName"] == null ? "null" : json["firstName"],
    lastName: json["lastName"] == null ? "" : json["lastName"],
    role: json["role"] == null ? "" : json["role"],
    email: json["email"] == null ? "" : json["email"],
    avatar: json["avatar"] == null ? "" : json["avatar"],
    phone: json["phone"] == null ? "" : json["phone"],
    isSetupDone: json["isSetupDone"] == null ? false : json["isSetupDone"],
    location: json["location"] == null ? "" : json["location"],
    displayName: json["displayName"] == null ? "" : json["displayName"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "role": role,
    "email": email,
    "avatar": avatar,
    "phone": phone,
    "isSetupDone": isSetupDone,
    "location": location,
    "displayName": displayName,
  };
}