

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/common_models/date_filter_model.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/repository/clients/discover_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';


class DiscoverDelegate implements DiscoverRepository {

  final _networkCalls = Network.shared;

  @override
  Future<RawgGameDetails> fetchNewlyReleasedGames(DateFilter date) async {
    try{
      var response = await _networkCalls.performRequest(APIConfig.getNewReleases(date), HttpAction.GET);
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
}