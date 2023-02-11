import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/src/response.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../models/sales/my_sales_payload.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error_manager.dart';
import '../clients/home_screen_repository.dart';

class HomeDelegate implements HomeRepository {
  final Network networkCalls;

  final _httpClient = sl<Network>();


  HomeDelegate(this.networkCalls);

  @override
  Future<MySalesPayload> getSalesFromWishList() async {
    try {
      var response =
          await networkCalls.performRequest(APIConfig.fetchSalesFromWishlist, HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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

  @override
  Future<MySalesPayload> getSoloGames() async {
    try {
      var response = await networkCalls.performRequest(APIConfig.fetchSoloGames(), HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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

  @override
  Future<MySalesPayload> getBundleGames() async {
    try {
      var response =
          await networkCalls.performRequest(APIConfig.fetchBundleGames(), HttpAction.GET);
      return await compute(mySalesPayloadFromJson, response.body);
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

  @override
  Future<Response> addToWishlist(Map<String, dynamic> body) async{
    return await _httpClient.performRequest(APIConfig.addToWishList, HttpAction.POST, body: body);
  }
}
