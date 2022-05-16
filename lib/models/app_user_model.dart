// To parse this JSON data, do
//
//     final authUserModel = authUserModelFromJson(jsonString);

import 'dart:convert';

import 'common_models/user/user_details.dart';

AuthUserModel authUserModelFromJson(String str) => AuthUserModel.fromJson(json.decode(str));

String authUserModelToJson(AuthUserModel data) => json.encode(data.toJson());

class AuthUserModel {
  AuthUserModel({
    this.user,
    this.token,
  });

  UserDetails? user;
  Token? token;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) => AuthUserModel(
    user: UserDetails.fromJson(json["user"]),
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


