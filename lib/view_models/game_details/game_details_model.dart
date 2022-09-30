import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_loading.dart';
import 'package:play_hq/models/game_details_models/game_details_model.dart';
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

import '../../models/game_status.dart';
import '../../models/rawg_models/rawg_game_details.dart';

abstract class GameDetailsModel extends ChangeNotifier with AppLoader {
  Future<void> getGameDetails(int id);

  void navigateMainScreen();

  void addToLibrary();

  void addToWishList();

  void deleteWishListGame(int id);

  void deleteLibraryGame(int id);

  void getGameStatus(int id);

  void selectedPlatform(int platformId);

  GameDetailModel get gameDetails;

  List<SalesPayload> get getSalesFromGame;

  List<GameResults> get similarGames;

  GameScreenshotModal get gameScreenshots;

  GameStatus get gameStatus;

  int get selectedPlatformId;
}
