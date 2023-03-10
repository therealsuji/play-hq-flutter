import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/user_repository.dart';
import 'package:play_hq/services/base_managers/error_manager.dart';

import '../../../helpers/app_strings.dart';
import '../../../models/common_models/game_preferences/request_body.dart';
import '../../../models/common_models/release_date_model.dart';
import '../../../models/loading_event_model.dart';
import '../../../repository/clients/setup_purchase_repository.dart';
import '../../../injection_container.dart';
import '../../../services/base_managers/response_manager.dart';
import '../../../services/nav_service.dart';
import 'purchase_account_model.dart';

class ISetupPurchaseAccountModel extends SetupPurchaseAccountModel {
  bool _currentGenreState = false;
  bool _currentPlatformState = false;
  bool _currentReleaseDateState = false;

  // Lists for the API call
  List<int> _genreList = [];
  List<int> _platformList = [];
  List<String> _releaseDateList = [];

  List<GamePreferencesRequest> _selectedGames = [];

  final _userApi = sl<UserRepository>();
  final _eventBus = sl<EventBus>();

  @override
  void loadDetails() async {
    loadingData(showOverlay: true);
    UserGamePreferences _preferences = await sl<UserRepository>().getUserGamePreferences();
    if(_preferences.genres.isNotEmpty){
      _currentGenreState = true;
    }
    _preferences.genres.forEach((element) {
      _genreList.add(element.id ?? 0);
    });
    if(_preferences.platforms.isNotEmpty){
      _currentPlatformState = true;
      _preferences.platforms.forEach((element) {
        _platformList.add(element.id ?? 0);
      });
    }
    notifyListeners();
    dataLoaded();
  }

  @override
  void addSelectedGenres(genreName) {
    if (_genreList.contains(genreName)) {
      _genreList.remove(genreName);
    } else {
      if (_genreList.length >= 3) {
        return;
      } else {
        _genreList.add(genreName);
      }
    }
    notifyListeners();
  }

  @override
  void changeGenreState(bool state) {
    _currentGenreState = state;
    notifyListeners();
  }

  @override
  bool get currentGenreState => _currentGenreState;

  @override
  List<int> get selectedGenres => _genreList;

  @override
  void changePlatformState(bool state) {
    _currentPlatformState = state;
    notifyListeners();
  }

  @override
  bool get currentPlatFormState => _currentPlatformState;

  @override
  void addSelectedPlatforms(platformName) {
    if (_platformList.contains(platformName)) {
      _platformList.remove(platformName);
    } else {
      if (_platformList.length >= 3) {
        return;
      } else {
        _platformList.add(platformName);
      }
    }
    notifyListeners();
  }

  @override
  void changeReleaseDateState(bool state) {
    _currentReleaseDateState = state;
    notifyListeners();
  }

  @override
  bool get currentReleaseDateState => _currentReleaseDateState;

  @override
  void addReleaseDates(releaseDates) {
    // ReleaseDate dates = ReleaseDate(fromDate: releaseDate['start'], toDate: releaseDate['end']);

    if (_releaseDateList.contains(releaseDates)) {
      _releaseDateList.remove(releaseDates);
    } else {
      _releaseDateList.add(releaseDates);
    }
    notifyListeners();
  }

  @override
  List<String> get selectedReleaseDates => _releaseDateList;

  @override
  void addSelectedGame(GamePreferencesRequest game) {
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<GamePreferencesRequest> get selectedGameList => _selectedGames;

  @override
  List<int> get selectedPlatforms => _platformList;

  @override
  void performAPIRequest() async {
    _eventBus.fire(LoadingEvent.show());

    var gamePreferances = {
      "genres": _genreList,
      "releaseDates": _releaseDateList,
      "platforms": _platformList
    };

    try {
      bool value = await sl<UserRepository>().addWishlistGames(_selectedGames);
      if(value){
        Response response = await sl<UserRepository>().updateUserPreferences(gamePreferances);
        if(response.statusCode >= 200 && response.statusCode < 300){
          sl<ResponseManager>().showResponse('Details Added Successfully', Colors.green);
          _eventBus.fire(LoadingEvent.hide());
          sl<NavigationService>().pushNamed(SETUP_SALES_ACCOUNT_ROUTE);
        }else{
          sl<ResponseManager>().showResponse('Something went wrong, please try again', Colors.redAccent);
        }
      }
    } catch (e) {
      print(e.toString());
      sl<ResponseManager>().showResponse('Something went wrong, please try again', Colors.redAccent);
      _eventBus.fire(LoadingEvent.hide());
    }
    notifyListeners();
  }

  @override
  void updatePreferences() async{
    sl<ErrorManager>().showError(NormalMessage(message: 'Updating Details') , Icon(Icons.info));
    var gamePreferances = {
      "genres": _genreList,
      "releaseDates": _releaseDateList,
      "platforms": _platformList
    };

    try{
      Response response = await sl<UserRepository>().updateUserPreferences(gamePreferances);
      if(response.statusCode >= 200 && response.statusCode < 300){
        sl<ResponseManager>().showResponse('Details Updated Successfully', Colors.green);
        await Future.delayed(Duration(seconds: 1));
        sl<NavigationService>().pushAndRemoveUntil(MAIN_SCREEN);
      }
    }catch(e){
      print(e.toString());
      sl<ResponseManager>().showResponse('Something went wrong, please try again', Colors.redAccent);
    }
  }
}
