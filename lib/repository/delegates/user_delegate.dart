import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network_helper.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';
import 'package:play_hq/repository/clients/user_repository.dart';

class UserDelegate extends UserRepository with NetworkHelper {
  @override
  Future<UserGamePreferences> getUserGamePreferences() {
    return this
        .get<UserGamePreferences>(APIConfig.userPreferences, userGameListsFromJson)
        .then((value) => value.result);
  }
}
