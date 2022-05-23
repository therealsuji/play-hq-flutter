import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';

abstract class DiscoverViewModel extends ChangeNotifier {


  void performAPIs();

  List<GameResults> get newlyReleasedGames;

  List<GameResults> get fpsGames;

}