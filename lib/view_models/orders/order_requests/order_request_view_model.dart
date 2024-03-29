

import 'package:flutter/material.dart';
import 'package:play_hq/models/orders_model/orders.dart';

abstract class OrderRequestViewModel with ChangeNotifier{

  void getOrderRequests(String saleId);

  void acceptPurchaseRequest(String id);

  void rejectPurchaseRequest(String id);

  List<Order> get orderRequests;

}