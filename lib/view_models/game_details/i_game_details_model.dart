import 'package:event_bus/event_bus.dart';
import 'package:intl/intl.dart';

import '../../injection_container.dart';
import '../../models/game_details_models/game_details_model.dart';
import '../../models/game_details_models/game_screenshot_modal.dart';
import '../../models/game_status.dart';
import '../../models/loading_event_model.dart';
import '../../models/rawg_models/rawg_game_details.dart';
import '../../models/sales/sales_payload_model.dart';
import '../../repository/clients/game_details_repository.dart';
import '../../services/nav_service.dart';
import 'game_details_model.dart';

class IGameDetailsModel extends GameDetailsModel {
  final _eventBus = sl<EventBus>();
  final _gameDetailsApi = sl<GameDetailsRepository>();

  GameDetailModel _gameDetailsModel = GameDetailModel();
  List<SalesPayload> _salesPayload = [];
  GameScreenshotModal _gameScreenshotModal = GameScreenshotModal();

  List<GameResults> _similarGames = [];

  List<int> platforms = [];
  int mainGenre = 0;

  GameStatus _gameStatus = GameStatus(gameLibrary: false, wishList: false);

  int _platformId = 0;

  @override
  Future<void> getGameDetails(int id) async {
    try {
      loadingData(showOverlay: true);
      await _gameDetailsApi.getGameDetails(id).then((model) {
        if (model != null) {
          model.gameDetails!.platforms!.removeWhere((element) => element.id == 4);
          _gameDetailsModel = model.gameDetails!;
          _gameScreenshotModal = model.gameScreenshots!;
          mainGenre = model.gameDetails!.genres![0].id ?? 0;
          model.gameDetails!.platforms!.forEach((element) {
            platforms.add(element.id ?? 0);
          });
          notifyListeners();
        }
      });

      await _gameDetailsApi.getSimilarGames(mainGenre.toString(), platforms).then((value) {
        _similarGames = value.results ?? [];
      });

      await _gameDetailsApi.getGameStatus(id).then((model) {
        _gameStatus = model;
      });

      await _gameDetailsApi.getSalesFromGame(id).then((value) {
        _salesPayload = value.saleItems ?? [];
      });
      dataLoaded();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void navigateMainScreen() {
    sl<NavigationService>().pop();
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
        "releaseDate":
            "${DateFormat('yyyy-MM-dd').format(DateTime.parse(_gameDetailsModel.released!))}",
      },
      "platform": _platformId
    };

    print('body is $body');

    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.setGameLibrary(body);

    getGameStatus(_gameDetailsModel.id ?? 0);

    _eventBus.fire(LoadingEvent.hide());

    sl<NavigationService>().pop();

    notifyListeners();
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
        "releaseDate":
            "${DateFormat('yyyy-MM-dd').format(DateTime.parse(_gameDetailsModel.released!))}",
      },
      "platform": _platformId
    };

    print('Body ' + body.toString());
    print('Platform ${_platformId.toString()}');

    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.setGameWishList(body);

    getGameStatus(_gameDetailsModel.id ?? 0);

    _eventBus.fire(LoadingEvent.hide());

    sl<NavigationService>().pop();

    notifyListeners();
  }

  @override
  void selectedPlatform(int platformId) {
    _platformId = platformId;
    notifyListeners();
  }

  @override
  void deleteLibraryGame(int id) async {
    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.deleteLibraryGame(id);
    getGameStatus(id);
    _eventBus.fire(LoadingEvent.hide());
    notifyListeners();
  }

  @override
  void deleteWishListGame(int id) async {
    _eventBus.fire(LoadingEvent.show());
    await _gameDetailsApi.deleteWishListGame(id);
    getGameStatus(id);
    _eventBus.fire(LoadingEvent.hide());
    notifyListeners();
  }

  @override
  void getGameStatus(int id) async {
    await _gameDetailsApi.getGameStatus(id).then((model) {
      _gameStatus = model;
    });
    notifyListeners();
  }

  @override
  GameStatus get gameStatus => _gameStatus;

  @override
  List<SalesPayload> get getSalesFromGame => _salesPayload;

  @override
  List<GameResults> get similarGames => _similarGames;

  @override
  int get selectedPlatformId => _platformId;

  @override
  GameDetailModel get gameDetails => _gameDetailsModel;

  @override
  GameScreenshotModal get gameScreenshots => _gameScreenshotModal;
}
