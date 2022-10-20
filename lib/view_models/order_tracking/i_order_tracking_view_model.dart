import 'package:event_bus/event_bus.dart';

import '../../helpers/app_enums.dart';
import '../../models/loading_event_model.dart';
import '../../repository/clients/order_repository.dart';
import '../../injection_container.dart';
import 'order_tracking_view_model.dart';

class IOrderTrackingViewModel extends OrderTrackingViewModel {
  final _eventBus = sl<EventBus>();
  final _orderAPI = sl<OrdersRepository>();

  @override
  void changeOrderStatus(String id, UserType userType, OrderStatus status) async {
    _eventBus.fire(LoadingEvent.show());
    await _orderAPI
        .changeOrderStatus(id, status, userType)
        .then((value) => _eventBus.fire(LoadingEvent.hide()));
  }
}
