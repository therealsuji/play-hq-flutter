

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/models/orders_model/orders.dart';
import 'package:play_hq/repository/clients/order_repository.dart';

class OrdersDelegate extends OrdersRepository{
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
  Future<OrdersModel> fetchOrder(String id) {
    // TODO: implement fetchOrder
    throw UnimplementedError();
  }

}