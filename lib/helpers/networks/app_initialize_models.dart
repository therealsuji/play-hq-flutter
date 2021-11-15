//Decide on the initialization data model based on the return response

import 'package:play_hq/models/create_sale_model.dart';
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/setup_purchase_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/wishlist_games_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

class InitializeData {
  static T fromJson<T>(dynamic json) {
    switch (T) {
      case UserModel:
        return UserModel.fromJson(json) as T;
      case SearchGame:
        return SearchGame.fromJson(json) as T;
      case CreateSalePayload:
        return CreateSalePayload.fromJson(json) as T;
      case SetupPurchaseModel:
        return SetupPurchaseModel.fromJson(json) as T;
      case WishListGames:
        return WishListGames.fromJson(json) as T;
      default:
        throw Exception("Unknown class");
    }
  }
}
