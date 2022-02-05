import 'package:flutter/foundation.dart';
import 'package:play_hq/models/common_models/game_model.dart';

abstract class HomeScreenModel extends ChangeNotifier {

  void onCarouselPageChanged(int index);

  int get carouselPageIndex;

  void getWishListGames();

  List<GameModel> get wishListGames;
}
