import 'package:event_bus/event_bus.dart';

import '../../../models/loading_event_model.dart';
import '../../../repository/clients/purchase_repository.dart';
import '../../../injection_container.dart';
import 'sales_details_view_model.dart';

class ISalesDetailsViewModel extends SalesDetailsViewModel {
  final _purchasesAPI = sl<PurchasesRepository>();
  final _eventBus = sl<EventBus>();

  String? _price;

  @override
  void getPrice(String price) {
    _price = price;
    notifyListeners();
  }

  @override
  void makePurchaseRequest(String saleId) async {
    _eventBus.fire(LoadingEvent.show());
    var purchaseRequest = {
      "saleId": saleId,
      "newPrice": _price,
    };
    try {
      await _purchasesAPI.createPurchaseRequest(purchaseRequest);
      _eventBus.fire(LoadingEvent.hide());
    } catch (e) {
      print(e.toString());
      _eventBus.fire(LoadingEvent.hide());
    }
    notifyListeners();
  }
}
