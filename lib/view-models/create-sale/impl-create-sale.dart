import 'package:play_hq/models/app-search-game-model.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';

class ImplCreateSale extends CreateSaleModel {
  ImplCreateSale() : super() {
    var test2 = new GameDetails(
        id: 2,
        name: "uncharted 2",
        released: "no",
        image: "https://i.pinimg.com/236x/3a/02/68/3a02685be25e504ea6bd2848e2a9715c--jeux-ps-ps-games.jpg");

    gameList.addAll([test2]);
  }

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
