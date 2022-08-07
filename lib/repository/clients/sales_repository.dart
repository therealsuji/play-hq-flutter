import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/common_models/page_model.dart';
import 'package:play_hq/models/sales/my_sales_payload.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

import '../../models/orders_model/orders.dart';

abstract class SaleRepository {
  Future<void> createSale(SalesPayload body);

  Future<MySalesPayload> fetchMyActiveSales();

  Future<OrdersModel> fetchOrdersForSales(String salesId);

  Future<void> deleteSale(String id);

  Future<PagedResult<SalesPayload>> fetchSalesFromUserOrders(
      int page, SaleOrderType saleOrderType, OrderStatus? saleStatus);
}
