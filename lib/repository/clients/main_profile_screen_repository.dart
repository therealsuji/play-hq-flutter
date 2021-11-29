
import 'package:play_hq/models/common_models/user_games_model.dart';

abstract class MainProfileScreenRepository {

  Future<List<UserGamesModel>> getWishListGames();

  Future<List<UserGamesModel>> getLibraryGames();

}