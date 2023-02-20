import 'package:play_hq/models/common_models/user/user_game_preferences.dart';

import '../../models/common_models/game_preferences/response_body.dart';

abstract class UserRepository {
  Future<UserGamePreferences> getUserGamePreferences();

  Future<GamePreferancesResponse> getWishlistGames();

}
