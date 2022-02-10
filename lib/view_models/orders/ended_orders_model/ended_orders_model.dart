import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:play_hq/helpers/app_enums.dart';

abstract class EndedOrderModel extends ChangeNotifier {

  void setBodyType(EndedOrderType type);

  EndedOrderType get bodyType;
}