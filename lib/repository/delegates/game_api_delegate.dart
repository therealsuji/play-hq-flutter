import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/repository/clients/game_api_repositiry.dart';

import '../../models/errors/exceptions.dart';
import '../../service_locator.dart';
import '../../services/base_managers/error.dart';

class GameApiDelegate extends GameApiRepository {
  final httpClient = Network.shared;

  Future<RawgGameDetails> httpHelper(Function networkFunction) async {
    try {
      var response = await httpClient.performRequest(networkFunction(), HttpAction.GET);
      return compute(rawgGameDetailsFromJson, response.body);
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
  Future<RawgGameDetails> getPopularGames() {
    return httpHelper(APIConfig.popularThisYear);
  }

  @override
  Future<RawgGameDetails> getUpComingGames() {
    return httpHelper(APIConfig.getUpcomingGames);
  }
}
