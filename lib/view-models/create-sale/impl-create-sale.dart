import 'package:play_hq/models/app-search-game-model.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';

class ImplCreateSale extends CreateSaleModel {
  @override
  addGame(GameDetails game) {
    gameList.add(game);
    notifyListeners();
  }

  @override
  removeGame(GameDetails game) {
    gameList.remove(game);
    notifyListeners();
  }
}
