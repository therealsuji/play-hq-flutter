

import 'package:hive/hive.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';
import 'package:play_hq/view-models/onboarding/setup-sales-account-view-model/sales-account-model.dart';

class ImplSetupSales extends SetupSalesModel{

  var box;

  List<GameDetails> _selectedGames = [];

  @override
  void addSelectedGame(GameDetails game) async{
    box = await Hive.openBox('libraryGames');
    box.add(game);
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<GameDetails> get selectedGameList => _selectedGames;

  @override
  void dispose() {
    // TODO: implement dispose
    box.close();
    super.dispose();
  }
}