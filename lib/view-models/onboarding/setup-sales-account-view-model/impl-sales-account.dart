

import 'package:hive/hive.dart';
import 'package:play_hq/models/app-search-game-model.dart';
import 'package:play_hq/view-models/onboarding/setup-sales-account-view-model/sales-account-model.dart';

class ImplSetupSales extends SetupSalesModel{

  List<GameDetails> _selectedGames = [];

  @override
  void addSelectedGame(GameDetails game) async{
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<GameDetails> get selectedGameList => _selectedGames;

}