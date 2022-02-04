import 'package:play_hq/service_locator.dart';
import 'package:play_hq/models/common_models/user_games_model.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/view_models/home_screen/home_screen_model.dart';

class IHomeScreenModel extends HomeScreenModel {

  final _homeApi = locator<HomeRepository>();

  int _carouselPageIndex = 0;
  List<GameModel> _wishListGames = [];

  @override
  void onCarouselPageChanged(int index) {
    _carouselPageIndex = index;
    notifyListeners();
  }

  @override
  void getWishListGames() {

  }

  @override
  int get carouselPageIndex => _carouselPageIndex;

  @override
  List<GameModel> get wishListGames => _wishListGames;
}
