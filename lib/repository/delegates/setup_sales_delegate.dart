

import 'dart:async';
import 'dart:io';

import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/models/onboarding_models/setup_sales_model.dart';
import 'package:play_hq/repository/clients/setup_sales_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';

class SetupSalesDelegate extends SetupSalesRepository {

  final _networkCalls = Network.shared;

  @override
  Future<void> setLibraryGames(List<FakePreferances> body) async {
    try{
      await _networkCalls.performRequest(APIConfig.addLibraryGames, HttpAction.POST, body: body);
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
  Future<void> setProfileDetails (SetupSalesModel body) async{
    try{
      await _networkCalls.performRequest(APIConfig.setupSales, HttpAction.PATCH, body: body);
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