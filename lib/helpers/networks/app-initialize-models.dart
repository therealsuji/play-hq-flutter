//Decide on the initialization data model based on the return response

import 'package:play_hq/models/create-sale-model.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';
import 'package:play_hq/models/app-user-model.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';

class InitializeData {
  static T fromJson<T>(dynamic json) {
    switch (T) {
      case UserModel:
        return UserModel.fromJson(json) as T;
      case SearchGame:
        return SearchGame.fromJson(json) as T;
      case CreateSalePayload:
        return CreateSalePayload.fromJson(json) as T;
      default:
        throw Exception("Unknown class");
    }
  }
}
