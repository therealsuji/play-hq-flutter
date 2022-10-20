import 'dart:async';
import 'dart:io';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error_manager.dart';
import '../clients/setup_purchase_repository.dart';

class SetupPurchaseDelegate extends SetupPurchaseRepository {
  final _networkCalls = Network.shared;

  @override
  Future<void> setGameWishList(dynamic body) async {
    try {
      await _networkCalls.performRequest(APIConfig.addWishListGames, HttpAction.POST, body: body);
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
  Future<void> setGamePreferences(Map<String, dynamic> body) async {
    try {
      await _networkCalls.performRequest(APIConfig.userPreferences, HttpAction.PUT, body: body);
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
