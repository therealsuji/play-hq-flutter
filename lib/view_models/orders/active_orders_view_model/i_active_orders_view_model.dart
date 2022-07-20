

import 'dart:ffi';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/orders_model/orders.dart';
import 'package:play_hq/repository/clients/order_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/view_models/orders/active_orders_view_model/active_orders_view_model.dart';

import '../../../models/loading_event_model.dart';

class IActiveOrdersViewModel extends ActiveOrdersViewModel {

  final _ordersAPI = locator<OrdersRepository>();
  final _eventBus = locator<EventBus>();

  List<Order> _activeSaleOrders = [];
  List<Order> _activePurchaseOrders =[];

  int _page = 0;

  @override
  void fetchAllActiveOrders() async {
    _eventBus.fire(LoadingEvent.show());
    await _ordersAPI.fetchAllActiveSalesOrders().then((value) {
      if(value.data!.length > 0){
        _activeSaleOrders = value.data ?? [];
        _ordersAPI.fetchAllActivePurchaseOrders().then((val){
          if(val.data!.length > 0){
            _activePurchaseOrders = value.data ?? [];
          }
          notifyListeners();
          _eventBus.fire(LoadingEvent.hide());
        });
      }
    });
  }

  @override
  List<Order> get activePurchaseOrderList => _activePurchaseOrders;

  @override
  List<Order> get activeSaleOrderList => _activeSaleOrders;

  @override
  // TODO: implement page
  int get page => _page;

  @override
  void pageChanged(int index) {
    _page = index;
    notifyListeners();
  }
}