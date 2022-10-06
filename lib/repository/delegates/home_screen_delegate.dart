import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../models/sales/my_sales_payload.dart';
import '../../service_locator.dart';
import '../../services/base_managers/error.dart';
import '../clients/home_screen_repository.dart';

class HomeDelegate implements HomeRepository {
  final Network networkCalls;

  const HomeDelegate(this.networkCalls);

  @override
  Future<MySalesPayload> getSalesFromWishList() async {
    try {
      var response =
          await networkCalls.performRequest(APIConfig.fetchSalesFromWishlist, HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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

  @override
  Future<MySalesPayload> getSoloGames() async {
    try {
      var response = await networkCalls.performRequest(APIConfig.fetchSoloGames(), HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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

  @override
  Future<MySalesPayload> getBundleGames() async {
    try {
      var response =
          await networkCalls.performRequest(APIConfig.fetchBundleGames(), HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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
