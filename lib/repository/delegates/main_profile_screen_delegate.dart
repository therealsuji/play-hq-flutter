import 'package:play_hq/models/common_models/user_games_model.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/repository/clients/main_profile_screen_repository.dart';

class MainProfileScreenDelegate extends MainProfileScreenRepository {
  @override
  Future<List<GameModel>> getLibraryGames() {
    // TODO: implement getLibraryGames
    throw UnimplementedError();
  }

  @override
  Future<List<GameModel>> getWishListGames() {
    // TODO: implement getWishListGames
    throw UnimplementedError();
  }


}