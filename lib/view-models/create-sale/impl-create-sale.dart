import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app-constants.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/networks/app-network.dart';
import 'package:play_hq/models/create-sale-model.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';

class ImplCreateSale extends CreateSaleModel {
  List<SaleGame> _gameList = [];
  Set<Map<String, dynamic>> _consoleList = [...popularConsoles].toSet();
  dynamic _selectedPlatform;
  GameCondition? _selectedGameCondition;
  bool _sheetSaved = false;
  bool _platformsIsExpanded = false;
  bool _isNegotiable = false;
  double _price = 0;
  String _remarks = '';
  bool _isFormValid = false;

  Set<Map<String, dynamic>> _allConsoles =
      [...popularConsoles, ...nintendoConsoles, ...playStationPlatforms, ...xboxPlatforms].toSet();

  @override
  Set<Map<String, dynamic>> get consoleList => _consoleList;

  @override
  List<SaleGame> get gameList => _gameList;

  @override
  GameCondition? get selectedGameCondition => _selectedGameCondition;

  @override
  get selectedPlatform => _selectedPlatform;

  @override
  bool get sheetSaved => _sheetSaved;

  @override
  bool get platformIsExpanded => _platformsIsExpanded;

  @override
  bool get isNegotiable => _isNegotiable;

  @override
  double get price => _price;

  @override
  String get remarks => _remarks;

  @override
  addGame(int id, String name, String image) {
    if (_gameList.length >= 3) return;
    if (!sheetSaved) return;
    var game = SaleGame(
        id: id,
        boxImage: image,
        title: name,
        gameCondition: describeEnum(selectedGameCondition!),
        platform: Platform(id: selectedPlatform));
    if (_gameList.where((game) => game.id == id).isEmpty) {
      _gameList.add(game);
      validateForm();
      notifyListeners();
    }
  }

  @override
  removeGame(int id) {
    _gameList.removeWhere((game) => game.id == id);
    validateForm();
    notifyListeners();
  }

  @override
  void createSale() async {
    // CreateSalePayload payload = CreateSalePayload(price: price, remarks: remarks, status: status, negotiable: negotiable, location: location, games: games)
    // Network.shared.createSale();
  }

  @override
  setSelectedGameCondition(GameCondition? condition) {
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

  @override
  void setIsNegotiable(bool value) {
    _isNegotiable = value;
    notifyListeners();
  }

  @override
  void setPrice(double value) {
    _price = value;
    validateForm();
    notifyListeners();
  }

  @override
  void setRemarks(String value) {
    _remarks = value;
    validateForm();
    notifyListeners();
  }

  @override
  bool get isFormValid => _isFormValid;

  @override
  void validateForm() {
    if (price != 0 && gameList.length != 0) {
      _isFormValid = true;
      return;
    }
    _isFormValid = false;
  }
}
