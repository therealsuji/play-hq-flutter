import 'package:play_hq/models/common_models/page_model.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/repository/delegates/sales_delegate.dart';

import '../../models/sales/my_sales_payload.dart';

abstract class HomeRepository {

  Future<MySalesPayload> getSalesFromWishList();

  Future<MySalesPayload> getSoloGames();

  Future<MySalesPayload> getBundleGames();

}
