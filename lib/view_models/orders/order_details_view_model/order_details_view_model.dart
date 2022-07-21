

import 'package:flutter/foundation.dart';

import '../../../helpers/app_enums.dart';

abstract class OrderDetailsViewModel with ChangeNotifier {

  void pageChanged(int index);

  int get page;

  void setBodyType(EndedOrderType type);

  EndedOrderType get bodyType;

}