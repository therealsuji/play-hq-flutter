

import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preference_model.dart';

abstract class SetupPurchaseRepository {

  Future<void> setGameWishList(List<GamePreferences> body);

  Future<void> setGamePreferences(Map<String, dynamic> body);

}