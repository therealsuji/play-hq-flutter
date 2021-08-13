import 'package:flutter/material.dart';
import 'package:play_hq/models/game_details_model.dart';

abstract class IGameDetailsModel with ChangeNotifier {

  Future<void> getGameDetails(int id);

  GameDetailsModel get gameDetails;

  void navigateMainScreen();

}