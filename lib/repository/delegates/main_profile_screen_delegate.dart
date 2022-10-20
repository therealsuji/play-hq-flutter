import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/common_models/game_preferences/response_body.dart';
import '../../models/common_models/user/user_details.dart';
import '../../models/errors/exceptions.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error.dart';
import '../clients/main_profile_screen_repository.dart';

class MainProfileScreenDelegate extends MainProfileScreenRepository {
  final _networkCalls = Network.shared;

  @override
  Future<GamePreferancesResponse> getLibraryGames() async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.getLibraryGames(), HttpAction.GET);
      return compute(gamePreferancesResponseFromJson, response.body);
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
  Future<GamePreferancesResponse> getWishListGames() async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.getWishListGames(), HttpAction.GET);
      return compute(gamePreferancesResponseFromJson, response.body);
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
  Future<UserDetails> getUserDetails() async {
    try {
      var response = await _networkCalls.performRequest(APIConfig.getUserDetails, HttpAction.GET);
      return compute(userDetailsfromJson, response.body);
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
