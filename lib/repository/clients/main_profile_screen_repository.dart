
import 'package:play_hq/models/common_models/user_games_model.dart';

abstract class MainProfileScreenRepository {

  Future<List<GameModel>> getWishListGames();

  Future<List<GameModel>> getLibraryGames();

}