
import 'package:flutter/material.dart';
import 'package:play_hq/models/orders_model/orders.dart';


abstract class ActiveOrdersViewModel with ChangeNotifier{

  List<OrdersModel> get activeOrderList;

  void fetchActiveOrders();

}