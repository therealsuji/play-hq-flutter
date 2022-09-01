// To parse this JSON data, do
//
//     final authUserModel = authUserModelFromJson(jsonString);

import 'dart:convert';

import 'package:play_hq/models/common_models/auth_token_model.dart';

import 'common_models/user/user_details.dart';

AuthUserModel authUserModelFromJson(String str) => AuthUserModel.fromJson(json.decode(str));

String authUserModelToJson(AuthUserModel data) => json.encode(data.toJson());

class AuthUserModel {
  AuthUserModel({
    this.user,
    this.token,
  });

  UserDetails? user;
  AuthTokenModel? token;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) => AuthUserModel(
    user: UserDetails.fromJson(json["user"]),
    token: AuthTokenModel.fromJson(json["token"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "token": token!.toJson(),
  };
}
