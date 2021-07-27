import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app-constants.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/models/create-sale-model.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';

class ImplCreateSale extends CreateSaleModel {
  List<SaleGame> _gameList = [];
  Set<Map<String, dynamic>> _consoleList = [...popularConsoles].toSet();
  dynamic _selectedPlatform;
  GameCondition _selectedGameCondition;
  bool _sheetSaved = false;
  bool _platformsIsExpanded = false;

  Set<Map<String, dynamic>> _allConsoles =
      [...popularConsoles, ...nintendoConsoles, ...playStationPlatforms, ...xboxPlatforms].toSet();

  @override
  Set<Map<String, dynamic>> get consoleList => _consoleList;

  @override
  List<SaleGame> get gameList => _gameList;

  @override
  GameCondition get selectedGameCondition => _selectedGameCondition;

  @override
  get selectedPlatform => _selectedPlatform;

  @override
  bool get sheetSaved => _sheetSaved;

  @override
  bool get platformIsExpanded => _platformsIsExpanded;

  @override
  addGame(int id, String name, String image) {
    if (_gameList.length >= 2) return;
    if (!sheetSaved) return;
    _gameList.toSet().add(
          SaleGame(
              id: id.toString(),
              boxImage: image,
              title: name,
              gameCondition: describeEnum(selectedGameCondition),
              platform: Platform(apiId: selectedPlatform, name: "")),
        ); // add a new game
    notifyListeners();
  }

  @override
  removeGame(int id) {
    notifyListeners();
  }

  @override
  Future<bool> createSale() {
    // Network.shared.createSale();
  }

  @override
  setSelectedGameCondition(GameCondition condition) {
    _selectedGameCondition = condition;
    notifyListeners();
  }

  @override
  setSelectedPlatform(id) {
    _selectedPlatform = id;
    notifyListeners();
  }

  @override
  void setPlatformIsExpanded(bool expanded) {
    _platformsIsExpanded = expanded;
    if (expanded) {
      _consoleList = _allConsoles;
    } else {
      _selectedPlatform = null;
      _consoleList = popularConsoles.toSet();
    }
    notifyListeners();
  }

  @override
  void setSheetSaved(bool isSaved) {
    _sheetSaved = isSaved;
    notifyListeners();
  }
}
