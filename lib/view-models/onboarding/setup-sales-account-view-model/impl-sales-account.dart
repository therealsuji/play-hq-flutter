

import 'package:hive/hive.dart';
import 'package:play_hq/models/app-search-game-model.dart';
import 'package:play_hq/view-models/onboarding/setup-sales-account-view-model/sales-account-model.dart';

class ImplSetupSales extends SetupSalesModel{

  List<GameDetails> _selectedGames = [];

  @override
  void addSelectedGame(GameDetails game) async{
    var box = await Hive.openBox('libraryGames');

    box.add(game);
    print("Selected Game Details" + box.getAt(0));
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<GameDetails> get selectedGameList => _selectedGames;

}