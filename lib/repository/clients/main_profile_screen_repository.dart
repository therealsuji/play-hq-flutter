
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';

abstract class MainProfileScreenRepository {

  Future<GamePreferancesResponse> getWishListGames();

  Future<GamePreferancesResponse> getLibraryGames();

}