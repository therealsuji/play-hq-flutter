import 'package:play_hq/models/common_models/page_model.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

abstract class HomeRepository {

  Future<PagedResult<SalesPayload>> getSalesFromWishList();
}
