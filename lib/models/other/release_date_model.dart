

class ReleaseDate {
  ReleaseDate({
    this.fromDate,
    this.toDate,
  });

  String? fromDate;
  String? toDate;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
    fromDate: json["from_date"],
    toDate: json["to_date"],
  );

  Map<String, dynamic> toJson() => {
    "from_date": fromDate,
    "to_date": toDate,
  };
}