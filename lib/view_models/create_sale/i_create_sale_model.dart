import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/create_sale_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/helpers/app_utils.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/create_sale/create_sale_model.dart';

class ICreateSaleModel extends CreateSaleModel {
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

  List<GamePreferances> _selectedGames = [];


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
    if (sheetSaved) {
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
    setSheetSaved(false);
    setSelectedGameCondition(null);
    setSelectedPlatform(null);
    setPlatformIsExpanded(false);
  }

  @override
  void updateGame(int id) {
    _gameList[id].gameCondition = describeEnum(selectedGameCondition!);
    _gameList[id].platform!.id = selectedPlatform;
    notifyListeners();
  }

  @override
  removeGame(int id) {
    _gameList.removeAt(id);
    validateForm();
    notifyListeners();
  }

  @override
  void createSale() async {
    locator<EventBus>().fire(LoadingEvent.show());
    Location location = Location(address: "SOMETIHING", lat: 123, long: 123);
    CreateSalePayload payload = CreateSalePayload(
        price: price,
        remarks: remarks.length == 0 ? "" : remarks,
        negotiable: _isNegotiable,
        location: location,
        games: _gameList);
    try {
      await Network.shared.createSale(payload);
      locator<EventBus>().fire(LoadingEvent.hide());
    } catch (e) {
      print(e.toString());
      locator<EventBus>().fire(LoadingEvent.hide());
    }
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

  //@override
  // get selectedGame => _selectedGame;

  @override
  void validateForm() {
    if (price != 0 && gameList.length != 0) {
      _isFormValid = true;
      return;
    }
    _isFormValid = false;
  }

  // @override
  // void setSelectedGame(dynamic value) {
  //   _selectedGame = value;
  //   if (value != null) {
  //     setSelectedGameCondition(GameCondition.values.enumFromString(_gameList[value].gameCondition));
  //     setSelectedPlatform(_gameList[value].platform!.id);
  //   } else {
  //     setSelectedGameCondition(null);
  //     setSelectedPlatform(null);
  //     setPlatformIsExpanded(false);
  //   }
  //   notifyListeners();
  // }

  @override
  void addSelectedGame(GamePreferances game) {
    _selectedGames.add(game);
    notifyListeners();
    locator<NavigationService>().pushNamed(CREATE_SALE_ROUTE);
  }

  @override
  List<GamePreferances> get selectedGameList => _selectedGames;

}
