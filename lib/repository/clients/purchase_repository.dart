

import 'package:play_hq/models/orders_model/order_details.dart';

import '../../models/orders_model/purchase_request.dart';

abstract class PurchasesRepository {

  Future<void> createPurchaseRequest(Map<String, dynamic> body);

}