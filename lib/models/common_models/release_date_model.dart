

class ReleaseDate {
  ReleaseDate({
    this.fromDate,
    this.toDate,
  });

  String? fromDate;
  String? toDate;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
    fromDate: json["fromDate"],
    toDate: json["toDate"],
  );

  Map<String, dynamic> toJson() => {
    "fromDate": fromDate,
    "toDate": toDate,
  };
}