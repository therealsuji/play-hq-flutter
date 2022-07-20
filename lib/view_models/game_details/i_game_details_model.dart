import 'package:event_bus/event_bus.dart';
import 'package:intl/intl.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/game_details_models/game_details_model.dart';
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart';
import 'package:play_hq/models/game_status.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/repository/clients/game_details_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/game_details/game_details_model.dart';

import '../../models/game_details_models/game_details_arguments.dart';

class IGameDetailsModel extends GameDetailsModel {

  final _eventBus = locator<EventBus>();
  final _gameDetailsApi = locator<GameDetailsRepository>();

  GameDetailModel _gameDetailsModel = GameDetailModel();
  GameScreenshotModal _gameScreenshotModal = GameScreenshotModal();

  GameStatus _gameStatus = GameStatus(gameLibrary: false, wishList: false);

  int _platformId = 0;

  @override
  Future<void> getGameDetails(int id) async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _gameDetailsApi.getGameDetails(id).then((model) {
        if(model != null){
          model.gameDetails!.platforms!.removeWhere((element) => element.id == 4);
          _gameDetailsModel = model.gameDetails!;
          _gameScreenshotModal = model.gameScreenshots!;
          notifyListeners();
        }
      });
      await _gameDetailsApi.getGameStatus(id).then((model) {
        _gameStatus = model;}
      );
      _eventBus.fire(LoadingEvent.hide());
      notifyListeners();
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
        "apiId": _gameDetailsModel.id,
        "boxCover": _gameDetailsModel.backgroundImage,
        "backgroundImage": _gameDetailsModel.backgroundImage,
        "images": [],
        "platforms": _gameDetailsModel.platforms!.map((e) => e.id).toList(),
        "genres": _gameDetailsModel.genres!.map((e) => e.id).toList(),
        "releaseDate": "${DateFormat('yyyy-MM-dd').format(DateTime.parse(_gameDetailsModel.released!))}",
      },
      "platform": _platformId
    };

    print('body is $body');

    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.setGameLibrary(body);
    _eventBus.fire(LoadingEvent.hide());

    locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN , args: GameDetailsArguments(gameId: _gameDetailsModel.id));
  }

  @override
  void addToWishList() async {

    print('releaseDate ' + _gameDetailsModel.released!);

    var body = {
      "game": {
        "title": _gameDetailsModel.nameOriginal,
        "apiId": _gameDetailsModel.id,
        "boxCover": _gameDetailsModel.backgroundImage,
        "backgroundImage": _gameDetailsModel.backgroundImage,
        "images": [],
        "platforms": _gameDetailsModel.platforms!.map((e) => e.id).toList(),
        "genres": _gameDetailsModel.genres!.map((e) => e.id).toList(),
        "releaseDate": "${DateFormat('yyyy-MM-dd').format(DateTime.parse(_gameDetailsModel.released!))}",
      },
      "platform": _platformId
    };

    print('Body ' + body.toString());
    print('Platform ${_platformId.toString()}');


    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.setGameWishList(body);
    _eventBus.fire(LoadingEvent.hide());

    locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN , args: GameDetailsArguments(gameId: _gameDetailsModel.id));
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

  @override
  void deleteLibraryGame(int id) async {
    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.deleteLibraryGame(id);
    getGameStatus(id);
    _eventBus.fire(LoadingEvent.hide());
    locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN , args: GameDetailsArguments(gameId: id));
  }

  @override
  void deleteWishListGame(int id) async {
    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.deleteWishListGame(id);
    getGameStatus(id);
    _eventBus.fire(LoadingEvent.hide());
    locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN  , args: GameDetailsArguments(gameId: id));
  }

  @override
  void getGameStatus(int id) {
    _gameDetailsApi.getGameStatus(id).then((model) {
      _gameStatus = model;}
    );
    notifyListeners();
  }

  @override
  GameStatus get gameStatus => _gameStatus;

}