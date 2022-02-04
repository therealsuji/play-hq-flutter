import 'dart:io';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:play_hq/service_locator.dart';

import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';

import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/services/base_managers/error.dart';
import 'package:play_hq/models/game_details_models/get_game_details.dart';
import 'package:play_hq/models/game_details_models/game_details_model.dart';
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart';
import 'package:play_hq/repository/repositories.dart' show GameDetailsRepository;

class GameDetailsDelegate extends GameDetailsRepository {

  final _networkCalls = Network.shared;

  @override
  Future<GetGameDetails?> getGameDetails(int id) async {

    try{

      var detailsResponse = await _networkCalls.performRequest(APIConfig.gameDetails(id), HttpAction.GET);
      var screenshotsResponse = await _networkCalls.performRequest(APIConfig.gameScreenshots(id), HttpAction.GET);

      var gameDetails = await compute(gameDetailsModelFromJson, detailsResponse.body);
      var screenshots = await compute(gameScreenshotModalFromJson, screenshotsResponse.body);

      return GetGameDetails(
        gameDetails: gameDetails,
        gameScreenshots: screenshots,
      );
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
      return null;
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
      return null;
    }
    catch(e){
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
      return null;
    }
  }

  @override
  Future<void> setGameLibrary(Map<String, dynamic> body) async {

    try{
      await _networkCalls.performRequest(APIConfig.addLibraryGames, HttpAction.POST, body: body);
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
    }
    catch(e){
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
    }
  }

  @override
  Future<void> setGameWishList(Map<String, dynamic> body) async {

    try{
      await _networkCalls.performRequest(APIConfig.addToWishList, HttpAction.POST, body: body);
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
    }
    catch(e){
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
    }
  }
}