

import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/app-search-game-model.dart';

abstract class SetupSalesModel with ChangeNotifier{

  List<GameDetails> get selectedGameList;

  void addSelectedGame(GameDetails game);

}