

import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/setup_purchase_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';

class SetupPurchaseDelegate extends SetupPurchaseRepository {

  final _networkCalls = Network.shared;

  @override
  Future<void> setGameWishList(Map<String, dynamic> body) async {
    try{
      await _networkCalls.performRequest(APIConfig.addWishListGames, HttpAction.POST, body: body);
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
    }
    catch(e){
      print('error ' + e.toString());
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
    }
  }

  @override
  Future<void> setGamePreferences(Map<String, dynamic> body) async {
    try{
      await _networkCalls.performRequest(APIConfig.setupPurchase, HttpAction.PATCH, body: body);
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
    }
    catch(e){
      print('error ' + e.toString());
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
    }
  }

}