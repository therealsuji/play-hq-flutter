import '../../models/sales/my_sales_payload.dart';

abstract class HomeRepository {
  Future<MySalesPayload> getSalesFromWishList();

  Future<MySalesPayload> getSoloGames();

  Future<MySalesPayload> getBundleGames();
}
