


import 'package:event_bus/event_bus.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:play_hq/models/orders_model/orders.dart';
import 'package:play_hq/repository/clients/order_repository.dart';
import 'package:play_hq/view_models/orders/order_requests/order_request_view_model.dart';

import '../../../models/loading_event_model.dart';
import '../../../service_locator.dart';

class IOrderRequestsViewModel extends OrderRequestViewModel {

  List<Order> _ordersModel = [];

  // API Calls and Loading Overlay
  final _eventBus = locator<EventBus>();
  final _ordersAPI = locator<OrdersRepository>();

  @override
  void getOrderRequests(String saleId) async{
    try{
      _eventBus.fire(LoadingEvent.show());

      await _ordersAPI.fetchOrder(saleId).then((value) {
        if(value.data!.length > 0){
          _ordersModel = value.data!;
        }
      });
      _eventBus.fire(LoadingEvent.hide());
      notifyListeners();
    }catch(e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  List<Order> get orderRequests => _ordersModel;

  @override
  void acceptPurchaseRequest(String id) async{
    try{
      _eventBus.fire(LoadingEvent.show());

      await _ordersAPI.acceptPurchaseRequest(id).then((value) {
        _eventBus.fire(LoadingEvent.hide());
      });
      notifyListeners();
    }catch(e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  void rejectPurchaseRequest(String id) async{
    try{
      _eventBus.fire(LoadingEvent.show());

      await _ordersAPI.rejectPurchaseRequest(id).then((value) {
        _eventBus.fire(LoadingEvent.hide());
      });
      notifyListeners();
    }catch(e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

}