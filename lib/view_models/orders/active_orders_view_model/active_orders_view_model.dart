
import 'package:flutter/material.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';


abstract class ActiveOrdersViewModel with ChangeNotifier{

  List<SalesPayload> get activeSaleOrderList;

  List<SalesPayload> get activePurchaseOrderList;

  void pageChanged(int index);

  int get page;

  void fetchPurchaseOrders();

  void fetchSaleOrders();

}