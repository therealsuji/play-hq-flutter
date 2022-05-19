import 'package:flutter/material.dart';
import 'package:play_hq/models/game_details_models/game_details_model.dart';
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart';

import '../../models/game_status.dart';

abstract class GameDetailsModel with ChangeNotifier {
  Future<void> getGameDetails(int id);

  void navigateMainScreen();

  void addToLibrary();

  void addToWishList();

  void deleteWishListGame(int id);

  void deleteLibraryGame(int id);

  void getGameStatus(int id);

  void selectedPlatform(int platformId);

  GameDetailModel get gameDetails;

  GameScreenshotModal get gameScreenshots;

  GameStatus get gameStatus;

  int get selectedPlatformId;
}
