import 'dart:convert';

Platform platformFromJson(String str) => Platform.fromJson(json.decode(str));

String platformToJson(Platform data) => json.encode(data.toJson());

class Platform {
  Platform({
    this.id,
    this.name,
    this.platformName,
  });

  int? id;
  String? name;
  String? platformName;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["id"],
    name: json["name"],
    platformName: json["platform_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "platform_name": platformName,
  };
}
