import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/base_managers/error.dart';

class HomeDelegate implements HomeRepository {

  final _networkCalls = Network.shared;

  // @override
  // Future<List<SalesPayload>> fetchSalesFromWishlist() async {
  //   try {
  //     var response = await _networkCalls.performRequest(APIConfig.fetchSalesFromWishlist, HttpAction.GET);
  //     return compute(salesModelFromJson, response.body);
  //   } on TimeoutException {
  //     locator<ErrorManager>().setError(PlayHQTimeoutException());
  //     throw PlayHQTimeoutException();
  //   } on SocketException {
  //     locator<ErrorManager>().setError(PlayHQSocketException());
  //     throw PlayHQSocketException();
  //   } catch (e) {
  //     locator<ErrorManager>().setError(PlayHQGeneralException(
  //       errorText: e.toString(),
  //     ));
  //     throw PlayHQGeneralException(
  //       errorText: e.toString(),
  //     );
  //   }
  // }

}
