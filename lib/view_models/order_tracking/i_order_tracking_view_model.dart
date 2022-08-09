

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/repository/clients/order_repository.dart';
import 'package:play_hq/view_models/order_tracking/order_tracking_view_model.dart';

import '../../service_locator.dart';

class IOrderTrackingViewModel extends OrderTrackingViewModel {

  final _eventBus = locator<EventBus>();
  final _orderAPI = locator<OrdersRepository>();

  @override
  void changeOrderStatus(String id, UserType userType, OrderStatus status) async{
    _eventBus.fire(LoadingEvent.show());
    await _orderAPI.changeOrderStatus(id, status, userType).then((value) => _eventBus.fire(LoadingEvent.hide()));
  }

}