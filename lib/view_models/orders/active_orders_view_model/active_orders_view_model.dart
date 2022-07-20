
import 'package:flutter/material.dart';
import 'package:play_hq/models/orders_model/orders.dart';


abstract class ActiveOrdersViewModel with ChangeNotifier{

  List<Order> get activeSaleOrderList;

  List<Order> get activePurchaseOrderList;

  void pageChanged(int index);

  int get page;

  void fetchAllActiveOrders();

}