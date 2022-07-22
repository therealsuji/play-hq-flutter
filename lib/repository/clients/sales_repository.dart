import 'package:play_hq/models/sales/my_sales_payload.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

import '../../models/orders_model/orders.dart';

abstract class SaleRepository{

  Future<void> createSale(SalesPayload body);

  Future<MySalesPayload> fetchMyActiveSales();

  Future<OrdersModel> fetchOrdersForSales(String salesId);

  Future<void> deleteSale(String id);

}