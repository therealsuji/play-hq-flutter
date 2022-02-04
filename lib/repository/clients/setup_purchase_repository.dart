

import 'package:play_hq/models/common_models/game_preferance_model.dart';

abstract class SetupPurchaseRepository {

  Future<void> setGameWishList(List<GamePreferances> body);

  Future<void> setGamePreferences(Map<String, dynamic> body);

}