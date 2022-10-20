import 'package:event_bus/event_bus.dart';

import '../../../models/loading_event_model.dart';
import '../../../models/orders_model/orders.dart';
import '../../../repository/clients/order_repository.dart';
import '../../../injection_container.dart';
import 'order_request_view_model.dart';

class IOrderRequestsViewModel extends OrderRequestViewModel {
  List<Order> _ordersModel = [];

  // API Calls and Loading Overlay
  final _eventBus = sl<EventBus>();
  final _ordersAPI = sl<OrdersRepository>();

  @override
  void getOrderRequests(String saleId) async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _ordersAPI.fetchOrder(saleId).then((value) {
        if (value.data!.length > 0) {
          _ordersModel = value.data!;
        }
      });
      _eventBus.fire(LoadingEvent.hide());
      notifyListeners();
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  List<Order> get orderRequests => _ordersModel;

  @override
  void acceptPurchaseRequest(String id) async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _ordersAPI.acceptPurchaseRequest(id).then((value) {
        _eventBus.fire(LoadingEvent.hide());
      });
      notifyListeners();
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  void rejectPurchaseRequest(String id) async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _ordersAPI.rejectPurchaseRequest(id).then((value) {
        _eventBus.fire(LoadingEvent.hide());
      });
      notifyListeners();
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }
}
