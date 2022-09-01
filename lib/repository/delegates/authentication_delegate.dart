

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/app_user_model.dart' as user_model;
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/authentication_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';

class AuthenticationDelegate extends AuthenticationRepository {

  final _networkCalls = Network.shared;

  @override
  Future<AuthUserModel?> backendLogin(Map<String, dynamic> body) async{
    try{
      var response = await _networkCalls.performRequest(APIConfig.login, HttpAction.POST , body: body);
      return compute(authUserModelFromJson , response.body);
    }on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
      return null;
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
      return null;
    }
    catch(e){
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
      return null;
    }
  }

  @override
  Future<AuthUserModel> renewTokens(dynamic body) async {
    try {
      var response = await _networkCalls.performRequest(APIConfig.renewJwt, HttpAction.POST , body: body);
      return compute(authUserModelFromJson, response.body);
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
