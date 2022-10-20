import 'package:event_bus/event_bus.dart';

import '../../../models/loading_event_model.dart';
import '../../../models/sales/sales_payload_model.dart';
import '../../../repository/clients/sales_repository.dart';
import '../../../injection_container.dart';
import 'fetch_sales_view_model.dart';

class IMySalesViewModel extends MySalesViewModel {
  // API Calls and Loading Overlay
  final _eventBus = sl<EventBus>();
  final _salesAPI = sl<SaleRepository>();

  List<SalesPayload> _activeSales = [];

  @override
  List<SalesPayload> get fetchActiveSales => _activeSales;

  @override
  void fetchAllSales() async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _salesAPI.fetchMyActiveSales().then((value) {
        if (value.saleItems!.length > 0) {
          _activeSales = value.saleItems!;
          _eventBus.fire(LoadingEvent.hide());
        }
      });
      notifyListeners();
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  void deleteSale(String id) async {
    try {
      _eventBus.fire(LoadingEvent.show());
      await _salesAPI.deleteSale(id).then((value) {
        _salesAPI.fetchMyActiveSales().then((value) {
          if (value.saleItems!.length > 0) {
            _activeSales = value.saleItems!;
            _eventBus.fire(LoadingEvent.hide());
          }
        });
      });
      notifyListeners();
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }
}
