import 'dart:convert';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';
import 'package:play_hq/repository/clients/game_details_repository.dart';
import 'package:play_hq/repository/clients/user_repository.dart';
import 'package:play_hq/services/base_managers/response_manager.dart';
import 'package:play_hq/services/nav_service.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../injection_container.dart';
import '../../models/app_genre_model.dart';
import '../../models/common_models/user/user_details.dart';
import '../../models/common_models/user/user_game_preferences.dart';
import '../../models/rawg_models/rawg_game_details.dart';
import '../../models/sales/sales_payload_model.dart';
import '../../repository/clients/game_api_repositiry.dart';
import '../../repository/clients/home_screen_repository.dart';
import '../../repository/clients/skeleton_loading_repository.dart';
import '../../services/auth_service.dart';
import 'home_screen_model.dart';

class IHomeScreenModel extends HomeScreenModel {
  final _homeApi = sl<HomeRepository>();
  final _gameApi = sl<GameApiRepository>();
  final _gameDetailsApi = sl<GameDetailsRepository>();
  final _loadingSkeleton  = sl<SkeletonLoadingRepository>();
  final _userApi = sl<UserRepository>();
  final _eventBus = sl<EventBus>();

  int _carouselPageIndex = 0;
  List<SalesPayload> _wishListGames = [];
  List<SalesPayload> _soloGames = [];
  List<SalesPayload> _bundleGames = [];
  List<GameResults> _popularGameThisYear = [];
  List<GameResults> _upcomingGamesThisYear = [];
  List<GameResults> _recommendedGames = [];
  List<Genre> _prefGenre = [];
  List<Data> _userWishlistGames = [];

  int _selectedPlatform = 0;
  List<Genre> _defaultGenre = [
    Genre(id: 4, imageBackground: ACTION_GENRE_IMAGE, name: "Action", gradient: GENRE_GRADIENT),
    Genre(id: 3, imageBackground: ADVENTURE_GENRE_IMAGE, name: "Adventure", gradient: GENRE_GRADIENT),
    Genre(id: 1, imageBackground: RACING_GENRE_IMAGE, name: "Racing", gradient: GENRE_GRADIENT)
  ];
  String? _displayName;

  @override
  void onCarouselPageChanged(int index) {
    _carouselPageIndex = index;
    notifyListeners();
  }

  @override
  void loadAPICalls() async {
    UserDetails userDetails = await _userApi.getUserDetails();
    UserGamePreferences gamePreferences = await _userApi.getUserGamePreferences();
    _userWishlistGames = await _userApi.getWishlistGames();
    _displayName = userDetails.displayName ?? "";
    _prefGenre = gamePreferences.genres;
    try {
      skeletonDataLoading();
      var n4 =
          _gameApi.getRecommendedGamesFromGenres().then((games) {
        if (games.results!.length > 0) {
          _recommendedGames = games.results ?? [];
        }
        notifyListeners();
      });
      await Future.wait([n4]);
      skeletonDataLoaded();
      var n3 = _gameApi.getUpComingGames().then((games) {
        if (games.results!.length > 0) {
          _upcomingGamesThisYear = games.results ?? [];
        }
        notifyListeners();
      });
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

  @override
  Future<void> addToWishlist(GameResults results) async {
    final _httpClient = sl<Network>();

    debugPrint('Selected Platform $_selectedPlatform');

    var body = {
      "game": {
        "title": results.name,
        "apiId": results.id,
        "boxCover": results.backgroundImage,
        "backgroundImage": results.backgroundImage,
        "images": [],
        "platforms": results.platforms!.map((e) => e.id).toList(),
        "genres": results.genres!.map((e) => e.id).toList(),
        "releaseDate": "${DateFormat('yyyy-MM-dd').format(DateTime.parse(results.released!))}",
      },
      "platform": _selectedPlatform
    };

    sl<NavigationService>().pop();

    Response response = await _gameDetailsApi.setGameWishList(body);

    if (response.statusCode == 201) {
      Data game = Data.fromJson(jsonDecode(response.body));
      _userWishlistGames.add(game);
      sl<ResponseManager>().showResponse('Game added to Wishlist', Colors.green);
      sl<AuthService>().saveWishlistGames(_userWishlistGames);
      notifyListeners();
    } else {
      sl<ResponseManager>().showResponse('Game added to Wishlist', Colors.green);
    }
    // _eventBus.fire(LoadingEvent.hide());
  }

  @override
  int get selectedPlatformId => _selectedPlatform;

  @override
  void selectPlatform(int platformId) {
    _selectedPlatform = platformId;
    notifyListeners();
  }

  @override
  List<Data> get wishlistGames => _userWishlistGames;
}
