import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/app_user_model.dart';
import '../../models/errors/exceptions.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error_manager.dart';
import '../clients/splash_repository.dart';

class SplashDelegate extends SplashRepository {
  final _networkCalls = Network.shared;

  @override
  Future<AuthUserModel> renewJwtToken(dynamic body) async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.renewJwt, HttpAction.POST, body: body);
      return compute(authUserModelFromJson, response.body);
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
