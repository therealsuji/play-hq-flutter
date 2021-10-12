import 'package:play_hq/models/wish_list_model.dart';

abstract class HomeRepository {

  Future<List<WishListModal>> getGameDetails();
}