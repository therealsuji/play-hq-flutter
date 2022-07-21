

import 'package:play_hq/view_models/orders/order_details_view_model/order_details_view_model.dart';

import '../../../helpers/app_enums.dart';

class IOrderDetailsViewModel extends OrderDetailsViewModel {

  int _page = 0;

  @override
  // TODO: implement page
  int get page => _page;

  @override
  void pageChanged(int index) {
    _page = index;
    notifyListeners();
  }

  EndedOrderType _bodyType = EndedOrderType.ORDER_DETAILS;

  @override
  void setBodyType(EndedOrderType type) {
    _bodyType = type;
    notifyListeners();
  }

  @override
  EndedOrderType get bodyType => _bodyType;


}