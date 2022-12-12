import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';

import '../../injection_container.dart';
import '../../models/app_genre_model.dart';
import '../../models/common_models/user/user_details.dart';
import '../../models/common_models/user/user_game_preferences.dart';
import '../../models/rawg_models/rawg_game_details.dart';
import '../../models/sales/sales_payload_model.dart';
import '../../repository/clients/game_api_repositiry.dart';
import '../../repository/clients/home_screen_repository.dart';
import '../../services/auth_service.dart';
import 'home_screen_model.dart';

class IHomeScreenModel extends HomeScreenModel {
  final _homeApi = sl<HomeRepository>();
  final _gameApi = sl<GameApiRepository>();

  int _carouselPageIndex = 0;
  List<SalesPayload> _wishListGames = [];
  List<SalesPayload> _soloGames = [];
  List<SalesPayload> _bundleGames = [];
  List<GameResults> _popularGameThisYear = [];
  List<GameResults> _upcomingGamesThisYear = [];
  List<GameResults> _recommendedGames = [];
  List<Genre> _prefGenre = [];
  // use this when user hasnt set any preferred genres
  List<Genre> _defaultGenre = [
    Genre(id: 4, imageBackground: ACTION_GENRE_IMAGE, name: "Action", gradient: GENRE_YELLOW_GRADIENT),
    Genre(id: 3, imageBackground: ADVENTURE_GENRE_IMAGE, name: "Adventure", gradient: GENRE_BLUE_GRADIENT),
    Genre(id: 1, imageBackground: RACING_GENRE_IMAGE, name: "Racing", gradient: GENRE_GREEN_GRADIENT)
  ];
  String? _displayName;

  @override
  void onCarouselPageChanged(int index) {
    _carouselPageIndex = index;
    notifyListeners();
  }

  @override
  void loadAPICalls() async {
    UserDetails userDetails = await sl<AuthService>().getUserDetails();
    UserGamePreferences gamePreferences = await sl<AuthService>().getUserGamePreferences();
    _displayName = userDetails.displayName ?? "";
    _prefGenre = gamePreferences.genres;
    try {
      loadingData();
      var n2 = _gameApi.getPopularGames().then((games) {
        if (games.results!.length > 0) {
          _popularGameThisYear = games.results ?? [];
        }
        notifyListeners();
      });
      var n3 = _gameApi.getUpComingGames().then((games) {
        if (games.results!.length > 0) {
          _upcomingGamesThisYear = games.results ?? [];
        }
        notifyListeners();
      });
      var n4 =
          _gameApi.getRecommendedGamesFromGenres(List.from(gamePreferences.genres.map((e) => (e.id)))).then((games) {
        if (games.results!.length > 0) {
          _recommendedGames = games.results ?? [];
        }
        notifyListeners();
      });
      await Future.wait([n2, n3, n4]);
      dataLoaded();
      notifyListeners();
    } catch (e) {
      print("Error Given " + e.toString());
      hideLoader();
    }
  }

  @override
  int get carouselPageIndex => _carouselPageIndex;

  @override
  List<SalesPayload> get wishListGames => _wishListGames;

  @override
  List<SalesPayload> get soloGames => _soloGames;

  @override
  List<SalesPayload> get bundleGames => _bundleGames;

  @override
  String? get displayName => _displayName;

  @override
  List<GameResults> get popularGamesThisYear => _popularGameThisYear;

  @override
  List<GameResults> get upComingGamesThisYear => _upcomingGamesThisYear;

  @override
  List<GameResults> get recommendedGames => _recommendedGames;

  @override
  List<Genre> get prefGenres => _prefGenre.length != 0 ? _prefGenre : _defaultGenre;
}
