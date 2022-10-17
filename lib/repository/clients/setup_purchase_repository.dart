import 'package:play_hq/models/common_models/game_preferences/request_body.dart';

abstract class SetupPurchaseRepository {

  Future<void> setGameWishList(List<GamePreferencesRequest> body);

  Future<void> setGamePreferences(Map<String, dynamic> body);

}