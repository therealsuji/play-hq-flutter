import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network_helper.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';
import 'package:play_hq/models/common_models/user/user_preferences.dart';
import 'package:play_hq/repository/clients/user_repository.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_network.dart';
import '../../injection_container.dart';
import '../../models/common_models/game_preferences/response_body.dart';

class UserDelegate extends UserRepository with NetworkHelper {

  final _httpClient = sl<Network>();

  @override
  Future<UserGamePreferences> getUserGamePreferences() {
    return this
        .fetchAll<UserGamePreferences>(APIConfig.userPreferences, userGameListsFromJson)
        .then((value) => value.result);
  }

  Future<Response> updateUserDetails(Map<String , dynamic> body) async{
    return await _httpClient.performRequest(APIConfig.updateUserDetails, HttpAction.PUT, body: body);
  }

  @override
  Future<GamePreferancesResponse> getWishlistGames() async{
    return this.fetchAll<GamePreferancesResponse>(APIConfig.getWishListGames() , gamePreferancesResponseFromJson).then((value) => value.result);
  }

  @override
  Future<GamePreferancesResponse> getLibraryGames() async {
    return this.fetchAll<GamePreferancesResponse>(APIConfig.getLibraryGames() , gamePreferancesResponseFromJson).then((value) => value.result);
  }

  @override
  Future<Response> updateUserPreferences(Map<String, dynamic> body) async{
    return await _httpClient.performRequest(APIConfig.userPreferences, HttpAction.PUT, body: body);
  }

  @override
  Future<bool> addLibraryGames(dynamic body) {
    return this.post(APIConfig.addLibraryGames, body).then((value) => value);
  }

  @override
  Future<bool> addWishlistGames(dynamic body) {
    return this.post(APIConfig.addWishListGames, body).then((value) => value);
  }

  @override
  Future<UserDetails> getUserDetails() {
    return this.fetchAll<UserDetails>(APIConfig.getUserDetails , userDetailsfromJson).then((value) => value.result);
  }
}
