// To parse this JSON data, do
//
//     final authUserModel = authUserModelFromJson(jsonString);

import 'dart:convert';

AuthUserModel authUserModelFromJson(String str) => AuthUserModel.fromJson(json.decode(str));

String authUserModelToJson(AuthUserModel data) => json.encode(data.toJson());

class AuthUserModel {
  AuthUserModel({
    this.user,
    this.token,
  });

  User? user;
  Token? token;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) => AuthUserModel(
    user: User.fromJson(json["user"]),
    token: Token.fromJson(json["token"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "token": token!.toJson(),
  };
}

class Token {
  Token({
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  });

  int? expiresIn;
  String? accessToken;
  String? refreshToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    expiresIn: json["expiresIn"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "expiresIn": expiresIn,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class User {
  User({
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

  dynamic firstName;
  dynamic lastName;
  String? role;
  String? email;
  dynamic avatar;
  String? phone;
  bool? isSetupDone;
  dynamic location;
  dynamic displayName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    lastName: json["lastName"],
    role: json["role"],
    email: json["email"],
    avatar: json["avatar"],
    phone: json["phone"],
    isSetupDone: json["isSetupDone"],
    location: json["location"],
    displayName: json["displayName"],
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
