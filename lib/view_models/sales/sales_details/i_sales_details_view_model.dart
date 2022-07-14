

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/repository/clients/purchase_repository.dart';
import 'package:play_hq/view_models/sales/sales_details/sales_details_view_model.dart';

import '../../../models/loading_event_model.dart';
import '../../../service_locator.dart';

class ISalesDetailsViewModel extends SalesDetailsViewModel {

  final _purchasesAPI = locator<PurchasesRepository>();
  final _eventBus = locator<EventBus>();

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
      "saleId" : saleId,
      "newPrice" : _price,
    };
    try{
      await _purchasesAPI.createPurchaseRequest(purchaseRequest);
      _eventBus.fire(LoadingEvent.hide());
    }catch (e) {
      print(e.toString());
      _eventBus.fire(LoadingEvent.hide());
    }
    notifyListeners();
  }


}