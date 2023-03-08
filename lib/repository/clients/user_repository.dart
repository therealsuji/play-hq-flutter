import 'package:http/http.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';

import '../../models/common_models/game_preferences/response_body.dart';
import '../../models/common_models/user/user_details.dart';

abstract class UserRepository {
  Future<UserGamePreferences> getUserGamePreferences();

  Future<GamePreferancesResponse> getWishlistGames();

  Future<Response> updateUserDetails(Map<String , dynamic> body);

  Future<Response> updateUserPreferences(Map<String , dynamic> body);

  Future<GamePreferancesResponse> getLibraryGames();
}
