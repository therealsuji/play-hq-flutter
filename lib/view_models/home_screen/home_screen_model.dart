import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_loading.dart';
import 'package:play_hq/models/app_genre_model.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

import '../../models/common_models/game_preferences/response_body.dart';

abstract class HomeScreenModel extends ChangeNotifier with AppLoader {
  void onCarouselPageChanged(int index);

  int get carouselPageIndex;

  void loadAPICalls();

  List<SalesPayload> get wishListGames;

  List<SalesPayload> get soloGames;

  List<GameResults> get popularGamesThisYear;

  List<GameResults> get upComingGamesThisYear;

  List<Data> get wishlistGames;

  Future<bool> addToWishlist(GameResults results);

  List<GameResults> get recommendedGames;

  List<SalesPayload> get bundleGames;

  String? get displayName;

  int get selectedPlatformId;

  void selectPlatform(int platformId);

  List<Genre> get prefGenres;
}
