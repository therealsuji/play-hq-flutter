import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/services/base_managers/response_manager.dart';

import '../../injection_container.dart';
import '../../models/common_models/game_preferences/response_body.dart';
import '../../models/game_details_models/game_details_model.dart';
import '../../models/game_details_models/game_screenshot_modal.dart';
import '../../models/game_status.dart';
import '../../models/rawg_models/rawg_game_details.dart';
import '../../models/sales/sales_payload_model.dart';
import '../../repository/clients/game_details_repository.dart';
import '../../services/auth_service.dart';
import '../../services/base_managers/error_manager.dart';
import '../../services/nav_service.dart';
import '../../widgets/snackbars/custom_flushbar.dart';
import 'game_details_model.dart';

class IGameDetailsViewModel extends GameDetailsViewModel {
  final GameDetailsRepository gameDetailsRepository;
  final NavigationService navigationService;
  final ErrorManager errorManager;

  GameDetailModel _gameDetailsModel = GameDetailModel();
  List<SalesPayload> _salesPayload = [];
  GameScreenshotModal _gameScreenshotModal = GameScreenshotModal();

  List<GameResults> _similarGames = [];
  List<Data> _userWishlistGames = [];

  List<int> platforms = [];
  int mainGenre = 0;

  GameStatus _gameStatus = GameStatus(gameLibrary: false, wishList: false);

  int _platformId = 0;

  IGameDetailsViewModel({
    required this.gameDetailsRepository,
    required this.navigationService,
    required this.errorManager,
  });

  @override
  Future<void> getGameDetails(int id) async {
    try {
      loadingData(showOverlay: true);
      await gameDetailsRepository.getGameDetails(id).then((model) {
        if (model != null) {
          model.gameDetails!.platforms!.removeWhere((element) => element.id == 4);
          _gameDetailsModel = model.gameDetails!;
          _gameScreenshotModal = model.gameScreenshots!;
          mainGenre = model.gameDetails!.genres![0].id ?? 0;
          model.gameDetails!.platforms!.forEach((element) {
            platforms.add(element.id ?? 0);
          });
        }
      });
      await gameDetailsRepository.getGameStatus(id).then((model) {
        _gameStatus = model;
      }).then((value) {
        dataLoaded();
      });


      await gameDetailsRepository.getSimilarGames(mainGenre.toString(), platforms).then((value) {
        _similarGames = value.results ?? [];
      });

      await gameDetailsRepository.getSalesFromGame(id).then((value) {
        _salesPayload = value.saleItems ?? [];
      });
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void navigateMainScreen() {
    navigationService.pop();
  }

  @override
  Future<void> addToLibrary() async {
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

    // _eventBus.fire(LoadingEvent.show());
    Response response = await gameDetailsRepository.setGameLibrary(body);

    // _eventBus.fire(LoadingEvent.hide());
    if(response.statusCode == 201){
      navigationService.pop();
      Data game = Data.fromJson(jsonDecode(response.body));
      sl<AuthService>().addGameToLibrary(game);
      sl<ResponseManager>().showResponse('${_gameDetailsModel.name} added to Library', Colors.green);
      getGameStatus(_gameDetailsModel.id ?? 0);
      notifyListeners();
    }else{
      navigationService.pop();
      sl<ResponseManager>().showResponse('Something went wrong, please try again', Colors.redAccent);
    }
  }

  @override
  Future<void> addToWishList() async {
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

    // _eventBus.fire(LoadingEvent.show());
    Response response  = await gameDetailsRepository.setGameWishList(body);

    if (response.statusCode == 201){
      Data game = Data.fromJson(jsonDecode(response.body));
      sl<AuthService>().addGameToWishlist(game);
      sl<ResponseManager>().showResponse('${_gameDetailsModel.name} added to Wishlist', Colors.green);
      getGameStatus(_gameDetailsModel.id ?? 0);
      navigationService.pop();
      notifyListeners();
    }else{
      navigationService.pop();
      sl<ResponseManager>().showResponse('Something went wrong, please try again', Colors.redAccent);
    }
  }

  @override
  void selectedPlatform(int platformId) {
    _platformId = platformId;
    notifyListeners();
  }

  @override
  void deleteLibraryGame(int id) async {
    // _eventBus.fire(LoadingEvent.show());
    errorManager.showError(UnknownFailure(
      message: "Removing from library game",
    ));
    await gameDetailsRepository.deleteLibraryGame(id);
    sl<AuthService>().removeFromLibrary(id);
    getGameStatus(id);
    // _eventBus.fire(LoadingEvent.hide());
    notifyListeners();
  }

  @override
  void deleteWishListGame(int id) async {
    // _eventBus.fire(LoadingEvent.show());
    await gameDetailsRepository.deleteWishListGame(id);
    errorManager.showError(UnknownFailure(
      message: "Removing from Wishlist Games",
    ));
    sl<AuthService>().removeFromWishlist(id);
    getGameStatus(id);
    // _eventBus.fire(LoadingEvent.hide());
    notifyListeners();
  }

  @override
  void getGameStatus(int id) async {
    await gameDetailsRepository.getGameStatus(id).then((model) {
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
