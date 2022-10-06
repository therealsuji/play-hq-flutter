import 'dart:async';
import 'dart:io';

import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/models/common_models/user/user_preferences.dart';
import 'package:play_hq/repository/clients/setup_sales_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';

class SetupSalesDelegate extends SetupSalesRepository {
  final _networkCalls = Network.shared;

  @override
  Future<void> setLibraryGames(List<GamePreferencesRequest> body) async {
    try {
      await _networkCalls.performRequest(APIConfig.addLibraryGames, HttpAction.POST, body: body);
    } on TimeoutException {
      locator<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      locator<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      locator<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> setProfileDetails(UserPreferencesModel body) async {
    try {
      await _networkCalls.performRequest(APIConfig.setupSales, HttpAction.PUT, body: body);
    } on TimeoutException {
      locator<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      locator<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      locator<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }
}
