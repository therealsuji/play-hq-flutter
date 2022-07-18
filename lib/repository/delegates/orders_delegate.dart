

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/models/orders_model/orders.dart';
import 'package:play_hq/repository/clients/order_repository.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../service_locator.dart';
import '../../services/base_managers/error.dart';

class OrdersDelegate extends OrdersRepository{

  final _networkCalls = Network.shared;


  @override
  Future<List<OrdersModel>> fetchAllActiveOrders() async {
    try{

      List<OrdersModel> testerOrderMap = [];

      testerOrders.map((e) => testerOrderMap.add(OrdersModel.fromJson(e))).toList();

      return Future.value(testerOrderMap);

    }catch(e){
      throw UnimplementedError();    }
  }

  @override
  Future<OrdersModel> fetchOrder(String saleId) async{
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

}