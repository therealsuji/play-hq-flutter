
import 'package:play_hq/models/common_models/game_preferance_model.dart';

abstract class MainProfileScreenRepository {

  Future<List<GamePreferances>> getWishListGames();

  Future<List<GamePreferances>> getLibraryGames();

}