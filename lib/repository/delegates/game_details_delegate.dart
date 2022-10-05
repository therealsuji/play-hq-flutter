import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../helpers/networks/app_network_helper.dart';
import '../../models/game_details_models/game_details_model.dart';
import '../../models/game_details_models/game_screenshot_modal.dart';
import '../../models/game_details_models/get_game_details.dart';
import '../../models/game_status.dart';
import '../../models/rawg_models/rawg_game_details.dart';
import '../../models/sales/my_sales_payload.dart';
import '../../service_locator.dart';
import '../repositories.dart' show GameDetailsRepository;

class GameDetailsDelegate extends GameDetailsRepository with NetworkHelper {
  final _httpClient = locator<Network>();

  @override
  Future<GetGameDetails?> getGameDetails(int id) async {
    var results = await Future.wait([
      _httpClient.performRequest(APIConfig.gameDetails(id), HttpAction.GET),
      _httpClient.performRequest(APIConfig.gameScreenshots(id), HttpAction.GET)
    ]);

    var gameDetails = await compute(gameDetailsModelFromJson, results[0].body);
    var screenshots = await compute(gameScreenshotModalFromJson, results[1].body);

    return GetGameDetails(
      gameDetails: gameDetails,
      gameScreenshots: screenshots,
    );
  }

  @override
  Future<void> setGameLibrary(Map<String, dynamic> body) async {
    await _httpClient.performRequest(APIConfig.addToLibrary, HttpAction.POST, body: body);
  }

  @override
  Future<void> setGameWishList(Map<String, dynamic> body) async {
    await _httpClient.performRequest(APIConfig.addToWishList, HttpAction.POST, body: body);
  }

  @override
  Future<void> deleteLibraryGame(int id) async {
    await _httpClient.performRequest(APIConfig.deleteLibraryGame(id), HttpAction.DELETE);
  }

  @override
  Future<void> deleteWishListGame(int id) async {
    await _httpClient.performRequest(APIConfig.deleteWishListGame(id), HttpAction.DELETE);
  }

  @override
  Future<GameStatus> getGameStatus(int id) async {
    var response = await _httpClient.performRequest(APIConfig.getGameStatus(id), HttpAction.GET);
    return compute(gameStatusFromJson, response.body);
  }

  @override
  Future<MySalesPayload> getSalesFromGame(int id) async {
    var response = await _httpClient.performRequest(APIConfig.getSalesFromGame(id), HttpAction.GET);
    return compute(mySalesPayloadFromJson, response.body);
  }

  @override
  Future<RawgGameDetails> getSimilarGames(String genre, List<int> platforms) async {
    var response = await _httpClient.performRequest(
        APIConfig.getSimilarGames(1, genre, platforms), HttpAction.GET);
    return compute(rawgGameDetailsFromJson, response.body);
  }
}
