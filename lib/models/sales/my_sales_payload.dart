

import 'dart:convert';

import 'package:play_hq/models/common_models/game_preferences/response_body.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

import '../common_models/metadata_model.dart';


MySalesPayload mySalesPayloadFromJson(String str) => MySalesPayload.fromJson(json.decode(str));

String mySalesPayloadToJson(MySalesPayload data) => json.encode(data.toJson());

class MySalesPayload {

  List<SalesPayload>? saleItems;
  MetaData? metaData;

  MySalesPayload({this.saleItems, this.metaData});

  factory MySalesPayload.fromJson(Map<String, dynamic> json) => MySalesPayload(
    saleItems: List<SalesPayload>.from(json["data"].map((x) => SalesPayload.fromJson(x))),
    metaData: MetaData.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(saleItems!.map((x) => x.toJson())),
    "meta": metaData!.toJson(),
  };

}