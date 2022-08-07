import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/repository/clients/sales_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/view_models/orders/active_orders_view_model/active_orders_view_model.dart';

import '../../../helpers/app_enums.dart';
import '../../../models/loading_event_model.dart';

class IActiveOrdersViewModel extends ActiveOrdersViewModel {
  final _salesAPI = locator<SaleRepository>();
  final _eventBus = locator<EventBus>();

  List<SalesPayload> _activeSaleOrders = [];
  List<SalesPayload> _activePurchaseOrders = [];

  int _page = 0;

  @override
  List<SalesPayload> get activePurchaseOrderList => _activePurchaseOrders;

  @override
  List<SalesPayload> get activeSaleOrderList => _activeSaleOrders;

  @override
  int get page => _page;

  @override
  void pageChanged(int index) {
    _page = index;
    notifyListeners();
  }

  @override
  void fetchPurchaseOrders() async {
    _eventBus.fire(LoadingEvent.show());
    await _salesAPI
        .fetchSalesFromUserOrders(1, SaleOrderType.SALE, OrderStatus.PLACED)
        .then((value) {
      if (value.data.length > 0) {
        _activeSaleOrders = value.data;
      }
    });

    await _salesAPI
        .fetchSalesFromUserOrders(1, SaleOrderType.PURCHASE, OrderStatus.PLACED)
        .then((value) {
      if (value.data.length > 0) {
        _activePurchaseOrders = value.data;
      }
    });
    _eventBus.fire(LoadingEvent.hide());
    notifyListeners();
  }

  @override
  void fetchSaleOrders() {
    // TODO: implement fetchSaleOrders
  }
}
