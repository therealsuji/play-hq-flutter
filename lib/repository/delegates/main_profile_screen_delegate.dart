import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/main_profile_screen_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';

class MainProfileScreenDelegate extends MainProfileScreenRepository {
  final _networkCalls = Network.shared;

  @override
  Future<GamePreferancesResponse> getLibraryGames() async {
    try {
      var response = await _networkCalls.performRequest(
          APIConfig.getLibraryGames(), HttpAction.GET);
      return compute(gamePreferancesResponseFromJson, response.body);
    } on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
      throw PlayHQTimeoutException();
    } on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
      throw PlayHQSocketException();
    } catch (e) {
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
      throw PlayHQGeneralException(
        errorText: e.toString(),
      );
    }
  }

  @override
  Future<GamePreferancesResponse> getWishListGames() async {
    try {
      var response = await _networkCalls.performRequest(
          APIConfig.getWishListGames(), HttpAction.GET);
      return compute(gamePreferancesResponseFromJson, response.body);
    } on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
      throw PlayHQTimeoutException();
    } on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
      throw PlayHQSocketException();
    } catch (e) {
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
      throw PlayHQGeneralException(
        errorText: e.toString(),
      );
    }
  }
}
