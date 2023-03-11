import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network_helper.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';
import 'package:play_hq/models/common_models/user/user_preferences.dart';
import 'package:play_hq/repository/clients/user_repository.dart';
import 'package:play_hq/services/base_managers/response_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/app_secure_storage.dart';
import '../../helpers/networks/app_network.dart';
import '../../injection_container.dart';
import '../../models/common_models/game_preferences/response_body.dart';

class UserDelegate extends UserRepository with NetworkHelper {

  final _httpClient = sl<Network>();
  static const USER_DETAILS_KEY = "userDetailsKey";
  static const USER_PREFERENCES_KEY = "userPreferencesKey";
  static const WISHLIST_GAMES_KEY = 'userWishlistGames';
  static const LIBRARY_GAMES_KEY = 'libraryGamesKey';

  @override
  Future<UserGamePreferences> getUserGamePreferences() async {
    var jsonData = await SecureStorage.readValue(USER_PREFERENCES_KEY);
    if(jsonData == null){
      UserGamePreferences userGamePreferences = await this.fetchAll<UserGamePreferences>(APIConfig.userPreferences, userGameListsFromJson , false).then((value) => value.result);
      SecureStorage.writeValue(USER_PREFERENCES_KEY, json.encode(userGamePreferences.toJson()));
      return userGamePreferences;
    }else{
      return UserGamePreferences.fromJson(json.decode(jsonData));
    }
  }

  Future<Response> updateUserDetails(Map<String , dynamic> body) async{
    return await _httpClient.performRequest(APIConfig.updateUserDetails, HttpAction.PUT, body: body);
  }

  @override
  Future<List<Data>> getWishlistGames() async{
    final prefs = await SharedPreferences.getInstance();
    var jsonData = prefs.getString(WISHLIST_GAMES_KEY);
    if(jsonData == null){
      GamePreferancesResponse gamePreferencesResponse = await this.fetchAll<GamePreferancesResponse>(APIConfig.getWishListGames() , gamePreferancesResponseFromJson , false).then((value) => value.result);
      await prefs.setString(WISHLIST_GAMES_KEY, GamePreferancesResponse.encode(gamePreferencesResponse.data));
      return gamePreferencesResponse.data;
    }else{
      return GamePreferancesResponse.decode(jsonData);
    }
  }

  @override
  Future<List<Data>> getLibraryGames() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonData = prefs.getString(LIBRARY_GAMES_KEY);
    if(jsonData == null){
      GamePreferancesResponse gamePreferencesResponse = await this.fetchAll<GamePreferancesResponse>(APIConfig.getLibraryGames() , gamePreferancesResponseFromJson , false).then((value) => value.result);
      await prefs.setString(LIBRARY_GAMES_KEY, GamePreferancesResponse.encode(gamePreferencesResponse.data));
      return gamePreferencesResponse.data;
    }else{
      return GamePreferancesResponse.decode(jsonData);
    }
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
  Future<UserDetails> getUserDetails() async{
    var jsonData = await SecureStorage.readValue(USER_DETAILS_KEY);
    if(jsonData == null){
      UserDetails user = await this.fetchAll<UserDetails>(APIConfig.getUserDetails , userDetailsfromJson , false).then((value) => value.result);
      SecureStorage.writeValue(USER_DETAILS_KEY, json.encode(user.toJson()));
      return user;
    }else{
      return UserDetails.fromJson(json.decode(jsonData));
    }
  }

  @override
  Future<void> addGameToWishlist(Data game) async{
    List<Data> games = [];
    final prefs = await SharedPreferences.getInstance();
    var jsonData = prefs.getString(WISHLIST_GAMES_KEY);
    bool value = await this.post(APIConfig.addToWishList, game);
    if(value){
      if(jsonData == null){
          GamePreferancesResponse gamePreferencesResponse = await this.fetchAll<GamePreferancesResponse>(APIConfig.getLibraryGames() , gamePreferancesResponseFromJson , false).then((value) => value.result);
          games = gamePreferencesResponse.data;
          games.add(game);
          await prefs.setString(LIBRARY_GAMES_KEY, GamePreferancesResponse.encode(games));
      }else{
          games = GamePreferancesResponse.decode(jsonData);
          games.add(game);
          await prefs.setString(LIBRARY_GAMES_KEY, GamePreferancesResponse.encode(games));
      }
      sl<ResponseManager>().showResponse('${game.game.title} added to Wishlist', Colors.green);
    }else{
      sl<ResponseManager>().showResponse('Something went wrong, please try again', Colors.redAccent);
    }
  }

  @override
  Future<void> addGameToLibrary(Data game) async {
    final prefs = await SharedPreferences.getInstance();
    var jsonData = prefs.getString(WISHLIST_GAMES_KEY);
    throw UnimplementedError();
  }
}
