//Decide on the initialization data model based on the return response

import 'package:play_hq/models/app-user-model.dart';

class InitializeData {
  static T fromJson<T>(dynamic json) {
    switch (T) {
      case UserModel:
        return UserModel.fromJson(json) as T;
      default:
        throw Exception("Unknown class");
    }
  }
}
