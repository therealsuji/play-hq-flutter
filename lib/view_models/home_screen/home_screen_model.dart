import 'package:flutter/foundation.dart';
import 'package:play_hq/models/wish_list_model.dart';

abstract class HomeScreenModel extends ChangeNotifier {

  void onCarouselPageChanged(int index);

  int get carouselPageIndex;

  void getWishListGames();

  List<WishListModal> get wishListGames;
}
