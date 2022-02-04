

import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/models/onboarding_models/setup_sales_model.dart';

abstract class SetupSalesRepository{

  Future<void> setLibraryGames(List<GamePreferances> body);

  Future<void> setProfileDetails(SetupSalesModel body);

}