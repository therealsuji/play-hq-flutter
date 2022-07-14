import 'dart:convert';

PurchaseRequest purchaseRequestFromJson(String str) => PurchaseRequest.fromJson(json.decode(str));

String purchaseRequestToJson(PurchaseRequest data) => json.encode(data.toJson());

class PurchaseRequest {
  PurchaseRequest({
    this.saleId,
    this.newPrice,
  });

  String? saleId;
  String? newPrice;

  factory PurchaseRequest.fromJson(Map<String, dynamic> json) => PurchaseRequest(
    saleId: json["saleId"],
    newPrice: json["newPrice"],
  );

  Map<String, dynamic> toJson() => {
    "saleId": saleId,
    "newPrice": newPrice,
  };
}