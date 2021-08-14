import 'package:flutter/material.dart';
import 'package:play_hq/models/game_details_model.dart';
import 'package:play_hq/models/game_screenshot_modal.dart';

abstract class IGameDetailsModel with ChangeNotifier {

  Future<void> getGameDetails(int id);

  GameDetailsModel get gameDetails;

  GameScreenshotModal get gameScreenshots;

  void navigateMainScreen();

}