import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/sales/sales_model.dart';

abstract class HomeRepository {

  Future<List<SalesPayload>> fetchSalesFromWishlist();

}