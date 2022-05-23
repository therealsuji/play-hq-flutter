import 'package:play_hq/models/sales/my_sales_payload.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

abstract class SaleRepository{

  Future<void> createSale(SalesPayload body);

  Future<MySalesPayload> fetchActiveSales();

}