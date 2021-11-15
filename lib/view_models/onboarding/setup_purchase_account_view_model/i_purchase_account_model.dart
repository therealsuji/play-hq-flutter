import 'package:event_bus/event_bus.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/setup_purchase_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/wishlist_games_model.dart';
import 'package:play_hq/models/other/release_date_model.dart';
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
  List<int> _genreList = [];
  List<int> _platformList = [];
  List<ReleaseDate> _releaseDateList = [];

  List<int> _selectedGenres = [];
  List<int> _selectedPlatforms = [];
  List<int> _selectedReleaseDates = [];
  List<WishListGameDetails> _selectedGames = [];

  final _setupPurchasesAPI = locator<SetupPurchaseRepository>();
  final _eventBus = locator<EventBus>();



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
  void addSelectedGame(WishListGameDetails game) {
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<WishListGameDetails> get selectedGameList => _selectedGames;

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
    SetupPurchaseModel model = SetupPurchaseModel(
      genres: _genreList,
      platforms:  _platformList,
      releaseDates: _releaseDateList
    );

    var gamePreferances = {
      "genres" : _selectedGenres,
      "release_dates" : _releaseDateList,
      "platforms" : _selectedPlatforms
    };

    var body = {
      "list": _selectedGames,
    };

    try {
      await _setupPurchasesAPI.setGameWishList(body);
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
