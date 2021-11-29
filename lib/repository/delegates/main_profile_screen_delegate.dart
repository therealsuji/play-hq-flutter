import 'package:play_hq/models/common_models/user_games_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/wishlist_games_model.dart';
import 'package:play_hq/repository/clients/main_profile_screen_repository.dart';

class MainProfileScreenDelegate extends MainProfileScreenRepository {
  @override
  Future<List<UserGamesModel>> getLibraryGames() {
    // TODO: implement getLibraryGames
    throw UnimplementedError();
  }

  @override
  Future<List<UserGamesModel>> getWishListGames() {
    // TODO: implement getWishListGames
    throw UnimplementedError();
  }


}