import 'package:play_hq/models/common_models/user/user_game_preferences.dart';

abstract class UserRepository {
  Future<UserGamePreferences> getUserGamePreferences();
  // TODO add set preference here
}
