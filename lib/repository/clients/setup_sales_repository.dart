

import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/onboarding_models/setup_sales_model.dart';

abstract class SetupSalesRepository{

  Future<void> setLibraryGames(List<GamePreferencesRequest> body);

  Future<void> setProfileDetails(SetupSalesModel body);

}