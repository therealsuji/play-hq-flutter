import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/game_details_models/game_details_model.dart';
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/repository/clients/game_details_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/game_details/game_details_model.dart';

class IGameDetailsModel extends GameDetailsModel {

  final _eventBus = locator<EventBus>();
  final _gameDetailsApi = locator<GameDetailsRepository>();

  GameDetailModel _gameDetailsModel = GameDetailModel();
  GameScreenshotModal _gameScreenshotModal = GameScreenshotModal();

  @override
  Future<void> getGameDetails(int id) async {

    try {

      _eventBus.fire(LoadingEvent.show());

      await _gameDetailsApi.getGameDetails(id).then((model) {
        if(model != null){
          _gameDetailsModel = model.gameDetails!;
          _gameScreenshotModal = model.gameScreenshots!;
        }
      });

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
  GameDetailModel get gameDetails => _gameDetailsModel;

  @override
  GameScreenshotModal get gameScreenshots => _gameScreenshotModal;

}