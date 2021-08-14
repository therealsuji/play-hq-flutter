class GameScreenshotModal {

  final int? count;
  final List<Result>? results;

  GameScreenshotModal({
    this.count,
    this.results,
  });

  factory GameScreenshotModal.fromJson(Map<String, dynamic> json) => GameScreenshotModal(
    count: json["count"] == null ? null : json["count"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );
}

class Result {

  final int id;
  final String image;

  const Result({
    required this.id,
    required this.image,
  });


  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
  );
}
