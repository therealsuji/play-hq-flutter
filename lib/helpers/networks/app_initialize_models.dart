//Decide on the initialization data model based on the return response

import 'package:play_hq/models/sales/sales_model.dart';
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_model.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/orders_model/orders.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

class InitializeData {
  static T fromJson<T>(dynamic json) {
    switch (T) {
      case SearchGame:
        return SearchGame.fromJson(json) as T;
      case SalesPayload:
        return SalesPayload.fromJson(json) as T;
      case SetupPurchaseModel:
        return SetupPurchaseModel.fromJson(json) as T;
      case OrdersModel:
        return OrdersModel.fromJson(json) as T;
      default:
        throw Exception("Unknown class");
    }
  }
}
