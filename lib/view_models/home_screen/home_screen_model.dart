import 'package:flutter/foundation.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

abstract class HomeScreenModel extends ChangeNotifier {
  void onCarouselPageChanged(int index);

  int get carouselPageIndex;

  void loadAPICalls();

  List<SalesPayload> get wishListGames;

  List<SalesPayload> get soloGames;

  List<GameResults> get popularGamesThisYear;

  List<GameResults> get upComingGamesThisYear;

  List<GameResults> get recommendedGames;

  List<SalesPayload> get bundleGames;

  String? get displayName;
}
