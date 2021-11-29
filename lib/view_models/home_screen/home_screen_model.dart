import 'package:flutter/foundation.dart';
import 'package:play_hq/models/common_models/user_games_model.dart';

abstract class HomeScreenModel extends ChangeNotifier {

  void onCarouselPageChanged(int index);

  int get carouselPageIndex;

  void getWishListGames();

  List<UserGamesModel> get wishListGames;
}
