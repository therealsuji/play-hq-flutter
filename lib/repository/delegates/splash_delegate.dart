import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/splash_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';

class SplashDelegate extends SplashRepository {
  final _networkCalls = Network.shared;

  @override
  Future<AuthUserModel> renewJwtToken(dynamic body) async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.renewJwt, HttpAction.POST, body: body);
      return compute(authUserModelFromJson, response.body);
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
