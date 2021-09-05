

import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';

abstract class SetupSalesModel with ChangeNotifier{

  List<GameDetails> get selectedGameList;

  void addSelectedGame(GameDetails game);

  void addLocation(String location);

  String get selectedLocation;

}