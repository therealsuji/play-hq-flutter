import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/repository/clients/user_repository.dart';
import 'package:play_hq/services/base_managers/error_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  List<Map<String,dynamic>> _apiReleaseDates = [];

  List<GamePreferencesRequest> _selectedGames = [];

  final _userApi = sl<UserRepository>();
  final _eventBus = sl<EventBus>();

  @override
  void loadDetails() async {
    loadingData(showOverlay: true);
    UserGamePreferences _preferences = await sl<UserRepository>().getUserGamePreferences();
    if(_preferences.genres.isNotEmpty){
      _currentGenreState = true;
      _preferences.genres.forEach((element) {
        _genreList.add(element.id ?? 0);
      });
    }
    if(_preferences.platforms.isNotEmpty){
      _currentPlatformState = true;
      _preferences.platforms.forEach((element) {
        _platformList.add(element.id ?? 0);
      });
    }

    if(_preferences.releaseDates.isNotEmpty){
      _currentReleaseDateState = true;
      _preferences.releaseDates.forEach((element) {
        _releaseDateList.add(releaseDates.firstWhere((date) => element.id == date.id).name ?? '');
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
  void addReleaseDates(datesString) {
    // ReleaseDate dates = ReleaseDate(fromDate: releaseDate['start'], toDate: releaseDate['end']);

    if (_releaseDateList.contains(datesString)) {
      _releaseDateList.remove(datesString);
    } else {
      _releaseDateList.add(datesString);
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

    releaseDates.forEach((element) {
      _releaseDateList.forEach((dateString) {
        if(element.name == dateString){
          var body = {
            'fromDate':element.fromDate,
            'toDate':element.toDate,
            'id': element.id
          };
          _apiReleaseDates.add(body);
        }
      });
    });

    debugPrint('Release Dates $_apiReleaseDates');

    var gamePreferances = {
      "genres": _genreList,
      "platforms": _platformList,
      "releaseDates": _apiReleaseDates,
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

    releaseDates.forEach((element) {
      _releaseDateList.forEach((dateString) {
        if(element.name == dateString){
          var body = {
            'fromDate':element.fromDate,
            'toDate':element.toDate,
            'id': element.id
          };
          _apiReleaseDates.add(body);
        }
      });
    });


    var gamePreferances = {
      "genres": _genreList,
      "releaseDates": _apiReleaseDates,
      "platforms": _platformList
    };

    try{
      Response response = await sl<UserRepository>().updateUserPreferences(gamePreferances);
      if(response.statusCode >= 200 && response.statusCode < 300){
        SecureStorage.deleteKey('userPreferencesKey');
        sl<ResponseManager>().showResponse('Details Updated Successfully', Colors.green);
        await Future.delayed(Duration(seconds: 1));
        sl<NavigationService>().pop();
      }
    }catch(e){
      print(e.toString());
      sl<ResponseManager>().showResponse('Something went wrong, please try again', Colors.redAccent);
    }
  }
}
