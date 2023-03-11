import 'package:http/http.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';

import '../../models/common_models/game_preferences/response_body.dart';
import '../../models/common_models/user/user_details.dart';

abstract class UserRepository {
  Future<UserGamePreferences> getUserGamePreferences();

  Future<List<Data>> getWishlistGames();

  Future<bool> addWishlistGames(dynamic body);

  Future<bool> addLibraryGames(dynamic body);

  Future<void> addGameToWishlist(Data game);

  Future<void> addGameToLibrary(Data game);

  Future<UserDetails> getUserDetails();

  Future<Response> updateUserDetails(Map<String , dynamic> body);

  Future<Response> updateUserPreferences(Map<String , dynamic> body);

  Future<List<Data>> getLibraryGames();
}
