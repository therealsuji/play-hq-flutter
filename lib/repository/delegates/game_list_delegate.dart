import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../models/rawg_models/rawg_game_details.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error.dart';
import '../clients/game_list_repository.dart';

class GameListDelegate extends GameListRepository {
  final _networkCalls = Network.shared;

  @override
  Future<RawgGameDetails> fetchTopRatedGames() async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.getTopRatedGames(), HttpAction.GET);
      return compute(rawgGameDetailsFromJson, response.body);
    } on TimeoutException {
      sl<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      sl<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      sl<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }

  @override
  Future<RawgGameDetails> fetchGamesOf2022() async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.getUpcomingGames(), HttpAction.GET);
      return compute(rawgGameDetailsFromJson, response.body);
    } on TimeoutException {
      sl<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      sl<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      sl<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }

  @override
  Future<RawgGameDetails> fetchUpcomingGames() async {
    try {
      var response = await _networkCalls.performRequest(APIConfig.getGamesOf2022(), HttpAction.GET);
      return compute(rawgGameDetailsFromJson, response.body);
    } on TimeoutException {
      sl<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      sl<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      sl<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }

  @override
  Future<RawgGameDetails> fetchGamesFromGenre(int page, String genre) async {
    try {
      var response = await _networkCalls.performRequest(
          APIConfig.getGamesByGenre(page, genre), HttpAction.GET);
      return compute(rawgGameDetailsFromJson, response.body);
    } on TimeoutException {
      sl<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      sl<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      sl<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }
}
