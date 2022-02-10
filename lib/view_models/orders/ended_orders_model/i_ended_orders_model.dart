import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/view_models/view_models.dart' show EndedOrderModel;

class IEndedOrderModel extends EndedOrderModel {

  EndedOrderType _bodyType = EndedOrderType.ORDER_DETAILS;

  @override
  void setBodyType(EndedOrderType type) {
    _bodyType = type;
    notifyListeners();
  }

  @override
  EndedOrderType get bodyType => _bodyType;
}