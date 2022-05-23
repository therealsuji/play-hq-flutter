

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/repository/clients/sales_repository.dart';

import '../../../service_locator.dart';
import 'fetch_sales_view_model.dart';

class IMySalesViewModel extends MySalesViewModel {

  // API Calls and Loading Overlay
  final _eventBus = locator<EventBus>();
  final _salesAPI = locator<SaleRepository>();

  List<SalesPayload> _activeSales = [];

  @override
  List<SalesPayload> get fetchActiveSales => _activeSales;

  @override
  void fetchAllSales() async{
    try{
      _eventBus.fire(LoadingEvent.show());

      await _salesAPI.fetchActiveSales().then((value) {
        if(value.saleItems!.length > 0){
          _activeSales = value.saleItems!;
          _eventBus.fire(LoadingEvent.hide());
        }
      });
      notifyListeners();
    }catch(e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

}