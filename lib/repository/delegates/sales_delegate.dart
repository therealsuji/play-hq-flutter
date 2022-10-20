import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/common_models/page_model.dart';
import '../../models/errors/exceptions.dart';
import '../../models/orders_model/orders.dart';
import '../../models/sales/my_sales_payload.dart';
import '../../models/sales/sales_payload_model.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error.dart';
import '../clients/sales_repository.dart';

class SaleDelegate extends SaleRepository {
  final _networkCalls = Network.shared;

  @override
  Future<void> createSale(SalesPayload body) async {
    try {
      await _networkCalls.performRequest(APIConfig.createSale, HttpAction.POST, body: body);
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
  Future<MySalesPayload> fetchMyActiveSales() async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.fetchMyActiveSales, HttpAction.GET);
      return compute(mySalesPayloadFromJson, response.body);
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
  Future<OrdersModel> fetchOrdersForSales(String saleId) async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.getOrdersForSale(saleId), HttpAction.GET);
      return compute(ordersModelFromJson, response.body);
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
  Future<void> deleteSale(String id) async {
    try {
      await _networkCalls.performRequest(APIConfig.deleteMySale(id), HttpAction.DELETE);
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
  Future<PagedResult<SalesPayload>> fetchSalesFromUserOrders(
      int page, SaleOrderType saleOrderType, OrderStatus? saleStatus) async {
    try {
      var response = await _networkCalls.performRequest(
          APIConfig.fetchSalesForUsersOrders(page: page, type: saleOrderType, status: saleStatus),
          HttpAction.GET);
      List<SalesPayload> sales = await compute(listSalesPayloadFromJson, response.body);
      PagedResult<SalesPayload> result =
          await PagedResult<SalesPayload>(sales, response.body).getResult();
      return result;
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
}
