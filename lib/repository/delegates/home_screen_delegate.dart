import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/models/wish_list_model.dart' as wishList;
import 'package:play_hq/models/wish_list_model.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/base_managers/error.dart';

class HomeDelegate implements HomeRepository {

  final _networkCalls = Network.shared;

  @override
  Future<List<WishListModal>> getGameDetails() async {

    try{

      var response = await _networkCalls.performRequest(APIConfig.getWishListGames(), HttpAction.GET);
      return compute(wishList.wishListModalFromJson, response.body);

    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
      return [];
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
      return [];
    }
    catch(e){
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
      return [];
    }

  }
  
}