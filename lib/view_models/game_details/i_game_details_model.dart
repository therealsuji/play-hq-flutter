import 'package:event_bus/event_bus.dart';
import 'package:intl/intl.dart';
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

  int _platformId = 0;

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
  void addToLibrary() async {

    var body = {
      "game": {
        "title": _gameDetailsModel.nameOriginal,
        "api_id": _gameDetailsModel.id,
        "box_cover": _gameDetailsModel.backgroundImage,
        "platforms": _gameDetailsModel.platforms!.map((e) => e.id).toList(),
        "genres": _gameDetailsModel.genres!.map((e) => e.id).toList(),
        "release_date": "${DateFormat('yyyy-MM-dd').format(DateTime.parse(_gameDetailsModel.released!))}",
      },
      "platform": _platformId
    };

    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.setGameLibrary(body);
    _eventBus.fire(LoadingEvent.hide());

    locator<NavigationService>().pop();
  }

  @override
  void addToWishList() async {

    var body = {
      "game": {
        "title": _gameDetailsModel.nameOriginal,
        "api_id": _gameDetailsModel.id,
        "box_cover": _gameDetailsModel.backgroundImage,
        "platforms": _gameDetailsModel.platforms!.map((e) => e.id).toList(),
        "genres": _gameDetailsModel.genres!.map((e) => e.id).toList(),
        "release_date": "${DateFormat('yyyy-MM-dd').format(DateTime.parse(_gameDetailsModel.released!))}",
      },
      "platform": _platformId
    };

    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.setGameWishList(body);
    _eventBus.fire(LoadingEvent.hide());

    locator<NavigationService>().pop();
  }

  @override
  void selectedPlatform(int platformId) {
    _platformId = platformId;
    notifyListeners();
  }

  @override
  int get selectedPlatformId => _platformId;

  @override
  GameDetailModel get gameDetails => _gameDetailsModel;

  @override
  GameScreenshotModal get gameScreenshots => _gameScreenshotModal;

}