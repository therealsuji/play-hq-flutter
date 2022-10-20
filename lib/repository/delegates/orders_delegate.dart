import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../models/orders_model/orders.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error.dart';
import '../clients/order_repository.dart';

class OrdersDelegate extends OrdersRepository {
  final _networkCalls = Network.shared;

  @override
  Future<OrdersModel> fetchAllActiveSalesOrders() async {
    try {
      var response =
          await _networkCalls.performRequest(APIConfig.fetchAllActiveSaleOrders(), HttpAction.GET);
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
  Future<OrdersModel> fetchOrder(String saleId) async {
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
  Future<void> acceptPurchaseRequest(String id) async {
    try {
      await _networkCalls.performRequest(APIConfig.acceptPurchaseRequest(id), HttpAction.GET);
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
  Future<void> rejectPurchaseRequest(String id) async {
    try {
      await _networkCalls.performRequest(APIConfig.rejectPurchaseRequest(id), HttpAction.GET);
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
  Future<OrdersModel> fetchAllActivePurchaseOrders() async {
    try {
      var response = await _networkCalls.performRequest(
          APIConfig.fetchAllActivePurchaseOrders(), HttpAction.GET);
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
  Future<void> changeOrderStatus(String id, OrderStatus status, UserType userType) async {
    try {
      await _networkCalls.performRequest(
          APIConfig.changeOrderStatus(user: userType, status: status, id: id), HttpAction.GET);
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
