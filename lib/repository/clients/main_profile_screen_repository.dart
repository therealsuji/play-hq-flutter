
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';

abstract class MainProfileScreenRepository {

  Future<GamePreferancesResponse> getWishListGames();

  Future<GamePreferancesResponse> getLibraryGames();

  Future<UserDetails> getUserDetails();

}