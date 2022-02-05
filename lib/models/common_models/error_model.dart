import 'dart:convert';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

class Error {
  Error({
    this.statusCode,
    this.error,
    this.message,
  });

  int? statusCode;
  String? error;
  String? message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    statusCode: json["statusCode"],
    error: json["error"],
    message: json["message"],
  );

}
