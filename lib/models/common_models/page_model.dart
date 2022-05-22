import 'dart:convert';

import 'package:flutter/foundation.dart';

_PageModel pageModelFromJson(String str) => _PageModel.fromJson(json.decode(str));

class _PageModel {
  _PageModel({
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

  factory _PageModel.fromJson(Map<String, dynamic> json) => _PageModel(
        page: json['meta']["page"],
        take: json['meta']["take"],
        itemCount: json['meta']["itemCount"],
        pageCount: json['meta']["pageCount"],
        hasPreviousPage: json['meta']["hasPreviousPage"],
        hasNextPage: json['meta']["hasNextPage"],
      );
}

class PagedResult<T> {
  List<T> data;

  _PageModel? meta;
  late String _bodyData;

  PagedResult(this.data, this._bodyData);

  PagedResult._meta(this.data, this.meta);

  Future<PagedResult<T>> getResult() async {
    _PageModel meta = await compute(pageModelFromJson, _bodyData);
    return PagedResult._meta(this.data, meta);
  }
}
