import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/sales/sales_model.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/sales_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../service_locator.dart';

class SaleDelegate extends SaleRepository{

  final _networkCalls = Network.shared;


  @override
  Future<void> createSale(dynamic body) async {
    try {
      var response = await _networkCalls.performRequest(APIConfig.createSale, HttpAction.POST , body: body);
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
  Future<List<SalesPayload>> fetchActiveSales() async {
    try {
      var response = await _networkCalls.performRequest(
          APIConfig.fetchAllActiveSales, HttpAction.GET);
      return compute(salesModelFromJson, response.body);
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