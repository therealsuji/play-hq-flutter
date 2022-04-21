

import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/onboarding_models/setup_sales_model.dart';

abstract class SetupSalesRepository{

  Future<void> setLibraryGames(List<FakePreferances> body);

  Future<void> setProfileDetails(SetupSalesModel body);

}