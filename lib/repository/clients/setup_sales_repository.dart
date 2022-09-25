import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/common_models/user/user_preferences.dart';

abstract class SetupSalesRepository {
  Future<void> setLibraryGames(List<GamePreferencesRequest> body);

  Future<void> setProfileDetails(UserPreferencesModel body);
}
