class MetaData {
  MetaData({
    this.page,
    this.take,
    this.itemCount,
    this.pageCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  int? page;
  int? take;
  int? itemCount;
  int? pageCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    page: json["page"],
    take: json["take"],
    itemCount: json["itemCount"],
    pageCount: json["pageCount"],
    hasPreviousPage: json["hasPreviousPage"],
    hasNextPage: json["hasNextPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "take": take,
    "itemCount": itemCount,
    "pageCount": pageCount,
    "hasPreviousPage": hasPreviousPage,
    "hasNextPage": hasNextPage,
  };
}