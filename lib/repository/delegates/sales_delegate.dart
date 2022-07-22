import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/orders_model/orders.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/sales_repository.dart';
import 'package:play_hq/services/base_managers/error.dart';

import '../../models/sales/my_sales_payload.dart';
import '../../service_locator.dart';

class SaleDelegate extends SaleRepository{

  final _networkCalls = Network.shared;


  @override
  Future<void> createSale(SalesPayload body) async {
    try {
      await _networkCalls.performRequest(APIConfig.createSale, HttpAction.POST , body: body);
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
  Future<MySalesPayload> fetchMyActiveSales() async {
    try {
      var response = await _networkCalls.performRequest(
          APIConfig.fetchMyActiveSales, HttpAction.GET);
      return compute(mySalesPayloadFromJson, response.body);
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
  Future<OrdersModel> fetchOrdersForSales(String saleId) async{
    try {
      var response = await _networkCalls.performRequest(
          APIConfig.getOrdersForSale(saleId), HttpAction.GET);
      return compute(ordersModelFromJson, response.body);
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
  Future<void> deleteSale(String id) async {
    try {
      await _networkCalls.performRequest(APIConfig.deleteMySale(id), HttpAction.DELETE);
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