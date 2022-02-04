

import 'dart:async';
import 'dart:io';

import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/setup_sales_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';

class SetupSalesDelegate extends SetupSalesRepository {

  final _networkCalls = Network.shared;

  @override
  Future<void> setLibraryGames(List<GamePreferances> body) async {
    try{
      await _networkCalls.performRequest(APIConfig.addToLibrary, HttpAction.POST, body: body);
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
  Future<void> setProfileDetails(Map<String, dynamic> body) {
    throw UnimplementedError();
  }

}