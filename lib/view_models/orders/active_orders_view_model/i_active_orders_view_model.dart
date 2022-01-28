

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/orders_model/orders.dart';
import 'package:play_hq/repository/clients/order_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/view_models/orders/active_orders_view_model/active_orders_view_model.dart';

class IActiveOrdersViewModel extends ActiveOrdersViewModel {

  final _ordersAPI = locator<OrdersRepository>();
  final _eventBus = locator<EventBus>();

  List<OrdersModel> _activeOrders = [];

  @override
  // TODO: implement activeOrderList
  List<OrdersModel> get activeOrderList => _activeOrders;

  @override
  void fetchActiveOrders() {
    _ordersAPI.getActiveOrders().then((value) {
      _activeOrders = value;
    });
    notifyListeners();
  }
}