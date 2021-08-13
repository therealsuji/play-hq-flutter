import 'package:event_bus/event_bus.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/networks/app-network.dart';
import 'package:play_hq/models/game_details_model.dart';
import 'package:play_hq/models/loading-event-model.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/game_details/i_game_details_model.dart';

class GameDetails extends IGameDetailsModel {

  final _networkCalls = Network.shared;
  final _eventBus = locator<EventBus>();

  GameDetailsModel _gameDetailsModel = GameDetailsModel();

  @override
  Future<void> getGameDetails(int id) async {

    try {
      _eventBus.fire(LoadingEvent.show());

      GameDetailsModel result = await _networkCalls.getGameDetails(id);
      _gameDetailsModel = result;
      notifyListeners();

      _eventBus.fire(LoadingEvent.hide());
    }catch (e) {
      print(e.toString());
    }
  }

  @override
  void navigateMainScreen() {
    locator<NavigationService>().pop();
  }

  @override
  GameDetailsModel get gameDetails => _gameDetailsModel;

}