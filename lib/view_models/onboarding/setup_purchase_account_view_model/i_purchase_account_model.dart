import 'dart:convert';

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/common_models/release_date_model.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/repository/clients/setup_purchase_repository.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/onboarding/setup_purchase_account_view_model/purchase_account_model.dart';
import '../../../service_locator.dart';

class ISetupPurchaseAccountModel extends SetupPurchaseAccountModel{

  bool _currentGenreState = false;
  bool _currentPlatformState = false;
  bool _currentReleaseDateState = false;

  int? _genreCount;
  int _platformCount = 0;
  int? _releaseDateCount;

  // Lists for the API call
  List<String> _genreList = [];
  List<String> _platformList = [];
  List<ReleaseDate> _releaseDateList = [];

  List<int> _selectedGenres = [];
  List<int> _selectedPlatforms = [];
  List<int> _selectedReleaseDates = [];
  List<GamePreferencesRequest> _selectedGames = [];

  final _setupPurchasesAPI = locator<SetupPurchaseRepository>();
  final _eventBus = locator<EventBus>();

  @override
  void addSelectedGenres(index , Map<String , dynamic> genre) {
    if(_selectedGenres.contains(index)) {
      _selectedGenres.remove(index);
      _genreList.remove(genre['id'].toString());
    }else{
      if(_selectedGenres.length >= 3){
        return;
      }else{
        _selectedGenres.add(index);
        _genreList.add(genre['id'].toString());
      }
    }
    _genreCount = _selectedGenres.length;
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
  // TODO: implement selectedItems
  List<int> get selectedGenres => _selectedGenres;

  @override
  void changePlatformState(bool state) {
    _currentPlatformState = state;
    notifyListeners();
  }

  @override
  bool get currentPlatFormState => _currentPlatformState;

  @override
  void addSelectedPlatforms(int index , Map<String , dynamic> platform) {
    if(_selectedPlatforms.contains(index)) {
      _selectedPlatforms.remove(index);
      _platformList.remove(platform['id'].toString());
    }else{
      if(_selectedPlatforms.length >= 3) {
        return;
      }
      else{
        _selectedPlatforms.add(index);
        _platformList.add(platform['id'].toString());
      }
    }
    notifyListeners();
    _platformCount = _platformList.length;
  }

  @override
  void changeReleaseDateState(bool state) {
    _currentReleaseDateState = state;
    notifyListeners();
  }

  @override
  bool get currentReleaseDateState => _currentReleaseDateState;

  @override
  void addReleaseDates(int index  , Map<String , dynamic> releaseDate) {

    ReleaseDate dates = ReleaseDate(
        fromDate: releaseDate['start'],
        toDate: releaseDate['end']
    );

    if(_selectedReleaseDates.contains(index)) {
      _selectedReleaseDates.remove(index);
      _releaseDateList.removeWhere((element) => element.fromDate == dates.fromDate);
    }else{
      _selectedReleaseDates.add(index);
      _releaseDateList.add(dates);
    }
    notifyListeners();
    _releaseDateCount = _selectedReleaseDates.length;
  }

  @override
  List<int> get selectedReleaseDates => _selectedReleaseDates;

  @override
  void addSelectedGame(GamePreferencesRequest game) {
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<GamePreferencesRequest> get selectedGameList => _selectedGames;

  @override
  int? get genreCount => _genreCount;

  @override
  int get totalPlatformCount => _platformCount;

  @override
  int? get releaseDateCount => _releaseDateCount;

  @override
  List<int> get selectedPlatforms => _selectedPlatforms;

  @override
  void performAPIRequest() async{
    _eventBus.fire(LoadingEvent.show());

    var gamePreferances = {
      "genres" : _genreList,
      "releaseDates" : _releaseDateList,
      "platforms" : _platformList
    };

    try {
      await _setupPurchasesAPI.setGameWishList(_selectedGames);
      await _setupPurchasesAPI.setGamePreferences(gamePreferances);
      _eventBus.fire(LoadingEvent.hide());
      locator<NavigationService>().pushNamed(SETUP_SALES_ACCOUNT_ROUTE);
    } catch (e) {
      print(e.toString());
      _eventBus.fire(LoadingEvent.hide());
    }
    notifyListeners();
  }
}
