import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/common_models/page_model.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../models/sales/my_sales_payload.dart';

class HomeDelegate implements HomeRepository {
  final Network networkCalls;

  HomeDelegate(this.networkCalls);

  @override
  Future<MySalesPayload> getSalesFromWishList() async {
    try {
      var response = await networkCalls.performRequest(APIConfig.fetchSalesFromWishlist, HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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

  @override
  Future<MySalesPayload> getSoloGames() async {
    try {
      var response = await networkCalls.performRequest(APIConfig.fetchSoloGames(), HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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

  @override
  Future<MySalesPayload> getBundleGames() async {
    try {
      var response = await networkCalls.performRequest(APIConfig.fetchBundleGames(), HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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
