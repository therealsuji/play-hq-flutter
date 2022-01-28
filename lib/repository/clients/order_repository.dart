

import 'package:play_hq/models/orders_model/orders.dart';

abstract class OrdersRepository {

  Future<List <OrdersModel>> getActiveOrders();

}