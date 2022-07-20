

import 'package:play_hq/models/orders_model/orders.dart';

abstract class OrdersRepository {

  Future<List<OrdersModel>> fetchAllActiveOrders();

  Future<OrdersModel> fetchOrder(String id);

  Future<void> acceptPurchaseRequest(String id);

  Future<void> rejectPurchaseRequest(String id);

}