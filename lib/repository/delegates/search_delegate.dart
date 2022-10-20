import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../models/search_model/app_search_game_model.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error_manager.dart';
import '../clients/search_repository.dart';

class SearchDelegate extends SearchRepository {
  final _networkCalls = Network.shared;

  @override
  Future<SearchGame> searchGame(String name) async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.getSearchResults(name), HttpAction.GET);
      return compute(searchGamefromJson, response.body);
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
