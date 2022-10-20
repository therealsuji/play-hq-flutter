import 'dart:async';
import 'dart:io';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/common_models/game_preferences/request_body.dart';
import '../../models/common_models/user/user_preferences.dart';
import '../../models/errors/exceptions.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error_manager.dart';
import '../clients/setup_sales_repository.dart';

class SetupSalesDelegate extends SetupSalesRepository {
  final _networkCalls = Network.shared;

  @override
  Future<void> setLibraryGames(List<GamePreferencesRequest> body) async {
    try {
      await _networkCalls.performRequest(APIConfig.addLibraryGames, HttpAction.POST, body: body);
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
  Future<void> setProfileDetails(UserPreferencesModel body) async {
    try {
      await _networkCalls.performRequest(APIConfig.setupSales, HttpAction.PUT, body: body);
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
