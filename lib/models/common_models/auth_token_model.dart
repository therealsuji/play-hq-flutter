// To parse this JSON data, do
//
//     final authTokenModel = authTokenModelFromJson(jsonString);

import 'dart:convert';

AuthTokenModel authTokenModelFromJson(String str) => AuthTokenModel.fromJson(json.decode(str));

String authTokenModelToJson(AuthTokenModel data) => json.encode(data.toJson());

class AuthTokenModel {
  AuthTokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) => AuthTokenModel(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}
