import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';
import 'package:play_hq/repository/clients/user_repository.dart';

import '../../../helpers/app_strings.dart';
import '../../../models/common_models/game_preferences/request_body.dart';
import '../../../models/common_models/release_date_model.dart';
import '../../../models/loading_event_model.dart';
import '../../../repository/clients/setup_purchase_repository.dart';
import '../../../injection_container.dart';
import '../../../services/nav_service.dart';
import 'purchase_account_model.dart';

class ISetupPurchaseAccountModel extends SetupPurchaseAccountModel {
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

  int _platformId = 0;

  final _userApi = sl<UserRepository>();
  final _eventBus = sl<EventBus>();

  @override
  void addSelectedGenres(index, Map<String, dynamic> genre) {
    if (_selectedGenres.contains(index)) {
      _selectedGenres.remove(index);
      _genreList.remove(genre['id'].toString());
    } else {
      if (_selectedGenres.length >= 3) {
        return;
      } else {
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
  void addSelectedPlatforms(int index, Map<String, dynamic> platform) {
    if (_selectedPlatforms.contains(index)) {
      _selectedPlatforms.remove(index);
      _platformList.remove(platform['id'].toString());
    } else {
      if (_selectedPlatforms.length >= 3) {
        return;
      } else {
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
  void addReleaseDates(int index, Map<String, dynamic> releaseDate) {
    ReleaseDate dates = ReleaseDate(fromDate: releaseDate['start'], toDate: releaseDate['end']);

    if (_selectedReleaseDates.contains(index)) {
      _selectedReleaseDates.remove(index);
      _releaseDateList.removeWhere((element) => element.fromDate == dates.fromDate);
    } else {
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
  void performAPIRequest() async {
    _eventBus.fire(LoadingEvent.show());

    var gamePreferances = {
      "genres": _genreList,
      "releaseDates": _releaseDateList,
      "platforms": _platformList
    };

    try {
      await Future.wait([
        sl<UserRepository>().addWishlistGames(_selectedGames),
        sl<UserRepository>().updateUserPreferences(gamePreferances)
      ]);
      _eventBus.fire(LoadingEvent.hide());
      sl<NavigationService>().pushNamed(SETUP_SALES_ACCOUNT_ROUTE);
    } catch (e) {
      print(e.toString());
      _eventBus.fire(LoadingEvent.hide());
    }
    notifyListeners();
  }

  @override
  void selectPlatform(int platformId) {
    _platformId = platformId;
    notifyListeners();
  }

  @override
  int get platformId => _platformId;

  @override
  void loadDetails() async {
    UserGamePreferences _preferences = await sl<UserRepository>().getUserGamePreferences();
    _currentGenreState = true;
    notifyListeners();
  }
}
