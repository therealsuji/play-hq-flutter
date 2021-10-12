import 'package:play_hq/service_locator.dart';
import 'package:play_hq/models/wish_list_model.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/view_models/home_screen/home_screen_model.dart';

class IHomeScreenModel extends HomeScreenModel {

  final _homeApi = locator<HomeRepository>();

  int _carouselPageIndex = 0;
  List<WishListModal> _wishListGames = [];

  @override
  void onCarouselPageChanged(int index) {
    _carouselPageIndex = index;
    notifyListeners();
  }

  @override
  void getWishListGames() {
    _homeApi.getGameDetails().then((gameList) {
      _wishListGames = gameList.toList();
      notifyListeners();
    });
  }

  @override
  int get carouselPageIndex => _carouselPageIndex;

  @override
  List<WishListModal> get wishListGames => _wishListGames;
}
