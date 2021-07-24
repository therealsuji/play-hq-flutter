import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';

abstract class CreateSaleModel with ChangeNotifier {
  List<GameDetails> _selectedGameList = [];

  List<GameDetails> get gameList => _selectedGameList;

  addGame(GameDetails game);

  removeGame(GameDetails id);
}
