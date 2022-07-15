import 'package:play_hq/models/common_models/page_model.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/repository/delegates/sales_delegate.dart';

abstract class HomeRepository {

  Future<PagedResult<SalesPayload>> getSalesFromWishList();

  Future<PagedResult<SalesPayload>> getSoloGames();

  Future<PagedResult<SalesPayload>> getBundleGames();

}
