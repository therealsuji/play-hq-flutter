

class ReleaseDate {
  ReleaseDate({
    this.fromDate,
    this.toDate,
    this.id,this.name
  });

  String? fromDate;
  String? toDate;
  String? name;
  int? id;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
    fromDate: json["fromDate"] == null ? '' : json['fromDate'],
    toDate: json["toDate"] == null ? '' : json['toDate'],
    id: json['id'] == null ? '' : json['id'],
    name: json['name'] == null ? '' : json['name']
  );

  Map<String, dynamic> toJson() => {
    "fromDate": fromDate,
    "toDate": toDate,
    "id":id
  };
}