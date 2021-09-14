import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/view_models/onboarding/setup_purchase_account_view_model/purchase_account_model.dart';

class ISetupPurchaseAccountModel extends SetupPurchaseAccountModel{

  bool _currentGenreState = false;
  bool _currentPlatformState = false;
  bool _currentReleaseDateState = false;

  int? _genreCount;
  int _platformCount = 0;
  int? _releaseDateCount;

  ReleaseDatesModel _releaseDates = ReleaseDatesModel();
  List<ReleaseDatesModel> _releaseDatesList = [];

  List<int> _selectedGenres = [];
  List<int> _selectedPlaystationPlatforms = [];
  List<int> _selectedXboxPlatforms = [];
  List<int> _selectedNintendoPlatforms = [];
  List<int> _selectedReleaseDates = [];
  List<GameDetails> _selectedGames = [];

  // TODO : This is the Genre Selection Methods
  @override
  void addSelectedGenres(index) {
    if(_selectedGenres.contains(index)) {
      _selectedGenres.remove(index);
    }else{
      if(_selectedGenres.length >= 5){
        return;
      }else{
        _selectedGenres.add(index);
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
  // TODO: implement currentPlatFormState
  bool get currentPlatFormState => _currentPlatformState;

  @override
  void addSelectedPlatforms(int index , PlatformSelection platformSelection) {
      switch (platformSelection) {
        case PlatformSelection.PlayStation:
          if(_selectedPlaystationPlatforms.contains(index)) {
            _selectedPlaystationPlatforms.remove(index);
          }else{
            if(_platformCount <=4){
              _selectedPlaystationPlatforms.add(index);
            }else{
              return;
            }
          }
          break;
        case PlatformSelection.Xbox:
          if(_selectedXboxPlatforms.contains(index)) {
            _selectedXboxPlatforms.remove(index);
          }else{
            if(_platformCount <= 4){
              _selectedXboxPlatforms.add(index);
            }else{
              return;
            }
          }
          break;
        case PlatformSelection.Nintendo:
          if(_selectedNintendoPlatforms.contains(index)) {
            _selectedNintendoPlatforms.remove(index);
          }else{
            if(_platformCount <= 4){
              _selectedNintendoPlatforms.add(index);
            }else{
              return;
            }
          }
          break;
        default:
          return;
      }
    _platformCount = _selectedPlaystationPlatforms.length + _selectedXboxPlatforms.length + _selectedNintendoPlatforms.length;
    notifyListeners();
  }

  @override
  // TODO: implement selectedPlatforms
  List<int> get selectedPlaystationPlatforms => _selectedPlaystationPlatforms;

  @override
  void changeReleaseDateState(bool state) {
    _currentReleaseDateState = state;
    notifyListeners();
  }

  @override
  // TODO: implement currentReleaseDateState
  bool get currentReleaseDateState => _currentReleaseDateState;

  @override
  void addReleaseDates(int index , String? releaseDates) {
    _releaseDates.id = index.toString();

    if(_selectedReleaseDates.contains(index)) {
      _selectedReleaseDates.remove(index);
      _releaseDatesList.remove(_releaseDates);
    }else{
      _selectedReleaseDates.add(index);
      _releaseDatesList.add(_releaseDates);
    }
    notifyListeners();
    _releaseDateCount = _releaseDatesList.length;
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
  // TODO: implement selectedNintendoPlatforms
  List<int> get selectedNintendoPlatforms => _selectedNintendoPlatforms;

  @override
  // TODO: implement selectedXboxPlatforms
  List<int> get selectedXboxPlatforms => _selectedXboxPlatforms;

  @override
  // TODO: implement releaseDateCount
  int? get releaseDateCount => _releaseDateCount;

}