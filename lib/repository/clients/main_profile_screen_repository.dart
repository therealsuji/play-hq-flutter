
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preference_model.dart';

abstract class MainProfileScreenRepository {

  Future<List<GamePreferences>> getWishListGames();

  Future<List<GamePreferences>> getLibraryGames();

}