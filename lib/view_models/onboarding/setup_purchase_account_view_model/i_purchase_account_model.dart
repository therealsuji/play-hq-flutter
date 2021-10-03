import 'package:event_bus/event_bus.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
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
  List<int> _genreList = [];
  List<int> _platformList = [];
  List<ReleaseDate> _releaseDateList = [];

  List<int> _selectedGenres = [];
  List<int> _selectedPlatforms = [];
  List<int> _selectedReleaseDates = [];
  List<GameDetails> _selectedGames = [];

  // TODO : This is the Genre Selection Methods
  @override
  void addSelectedGenres(index , Map<String , dynamic> genre) {
    if(_selectedGenres.contains(index)) {
      _selectedGenres.remove(index);
      _genreList.remove(genre['id']);
    }else{
      if(_selectedGenres.length >= 5){
        return;
      }else{
        _selectedGenres.add(index);
        _genreList.add(genre['id']);
      }
    }
    _genreCount = _selectedGenres.length;
    notifyListeners();
    print("Selected Genres " + _genreList.toString());
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
  // TODO: implement currentPlatFormState
  bool get currentPlatFormState => _currentPlatformState;

  @override
  void addSelectedPlatforms(int index , Map<String , dynamic> platform) {
    if(_selectedPlatforms.contains(index)) {
      _selectedPlatforms.remove(index);
      _platformList.remove(platform['id']);
    }else{
      if(_selectedPlatforms.length >= 3) {
        return;
      }
      else{
        _selectedPlatforms.add(index);
        _platformList.add(platform['id']);
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
  // TODO: implement currentReleaseDateState
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
  void addSelectedGame(GameDetails game) {
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<GameDetails> get selectedGameList => _selectedGames;

  @override
  int? get genreCount => _genreCount;

  @override
  // TODO: implement totalPlatformCount
  int get totalPlatformCount => _platformCount;

  @override
  // TODO: implement releaseDateCount
  int? get releaseDateCount => _releaseDateCount;

  @override
  // TODO: implement selectedPlatforms
  List<int> get selectedPlatforms => _selectedPlatforms;

  @override
  void performAPIRequest() async{
    locator<EventBus>().fire(LoadingEvent.show());
    SetupPurchaseModel model = SetupPurchaseModel(
      genres: _genreList,
      platforms:  _platformList,
      releaseDates: _releaseDateList
    );
    try {
      await Network.shared.setupPurchaseAccount(model);
      locator<NavigationService>().pushNamed(SETUP_SALES_ACCOUNT_ROUTE);
      locator<EventBus>().fire(LoadingEvent.hide());
    } catch (e) {
      print(e.toString());
      locator<EventBus>().fire(LoadingEvent.hide());
    }
    notifyListeners();
  }
}
