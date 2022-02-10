import 'package:play_hq/models/sales/sales_model.dart';

abstract class SaleRepository{

  Future<void> createSale(SalesPayload body);

  Future<List<SalesPayload>> fetchActiveSales();

}