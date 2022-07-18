

import 'dart:convert';

import 'package:play_hq/models/common_models/metadata_model.dart';
import 'package:play_hq/models/common_models/ordering_user.dart';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    this.data,
    this.meta,
  });

  List<Order>? data;
  MetaData? meta;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    data: List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
    meta: MetaData.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta!.toJson(),
  };
}

class Order {
  Order({
    this.id,
    this.deliveryDate,
    this.buyer,
    this.seller,
    this.saleId,
    this.orderDate,
    this.status,
    this.saleType,
    this.proposedPrice,
  });

  String? id;
  dynamic deliveryDate;
  OrderingUser? buyer;
  OrderingUser? seller;
  String? saleId;
  DateTime? orderDate;
  String? status;
  String? saleType;
  dynamic proposedPrice;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    deliveryDate: json["deliveryDate"],
    buyer: OrderingUser.fromJson(json["buyer"]),
    seller: OrderingUser.fromJson(json["seller"]),
    saleId: json["saleId"],
    orderDate: DateTime.parse(json["orderDate"]),
    status: json["status"],
    saleType: json["saleType"],
    proposedPrice: json["proposedPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "deliveryDate": deliveryDate,
    "buyer": buyer!.toJson(),
    "seller": seller!.toJson(),
    "saleId": saleId,
    "orderDate": orderDate!.toIso8601String(),
    "status": status,
    "saleType": saleType,
    "proposedPrice": proposedPrice,
  };
}
