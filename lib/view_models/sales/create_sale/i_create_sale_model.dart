import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/models/common_models/location_model.dart';
import 'package:play_hq/repository/clients/sales_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/models/sales/sales_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/services/dialog_service.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/sales/create_sale/create_sale_model.dart';

class ICreateSaleModel extends CreateSaleModel {
  bool _isNegotiable = false;
  double _price = 0;
  String _remarks = '';
  bool _isFormValid = false;

  int _selectedPlatform = 10;
  int _platformId = 0;

  String _currentCondition = '';

  List<GamePreferances> _selectedGames = [];

  DialogService _dialogService = locator<DialogService>();


  final _createSale = locator<SaleRepository>();

  @override
  get selectedPlatform => _selectedPlatform;

  @override
  bool get isNegotiable => _isNegotiable;

  @override
  double get price => _price;

  @override
  String get remarks => _remarks;

  Future doThings() async {
    print('dialog called');
    var dialogResult = await _dialogService.showDialog();
    print('dialog closed');
  }

  @override
  void createSale() async {
    locator<EventBus>().fire(LoadingEvent.show());
    LocationModel location = LocationModel(address: "SOMETIHING", lat: 123, long: 123);
    SalesPayload createSaleModel = SalesPayload(
        location: location,
        price: _price,
        remarks: _remarks,
        negotiable: _isNegotiable,
        games: _selectedGames);
    try {
      await _createSale.createSale(createSaleModel);
      doThings();
      print('Start Something');
      locator<EventBus>().fire(LoadingEvent.hide());

    } catch (e) {
      print(e.toString());
      locator<EventBus>().fire(LoadingEvent.hide());
    }
  }

  @override
  setSelectedPlatform(int selectedId, int platformId) {
    _platformId = platformId;
    _selectedPlatform = selectedId;
    validateForm();
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
    notifyListeners();
  }

  @override
  bool get isFormValid => _isFormValid;

  @override
  void validateForm() {
    _isFormValid = _price > 0 && _selectedPlatform!= 10 && _selectedGames.length > 0;
    notifyListeners();
  }

  @override
  void addSelectedGame(GamePreferances game) {
    _selectedGames.add(game);
    getCurrentCondition(game.id ?? 0);
    validateForm();
    notifyListeners();
    locator<NavigationService>().pushNamed(CREATE_SALE_ROUTE);
  }

  @override
  List<GamePreferances> get selectedGameList => _selectedGames;

  @override
  int get platformId => _platformId;

  @override
  void removeGame(int id) {
    print('Game ID is $id');
    _selectedGames.removeWhere((game) => game.id == id);
    validateForm();
    notifyListeners();
    // locator<NavigationService>().pop();
  }

  void updateGame(int id ){
    _selectedGames.where((element) => element.id == id).forEach((element) {
      element.conditionName = _currentCondition;
    });
    notifyListeners();
    locator<NavigationService>().pop();
  }

  @override
  void changeCurrentCondition(String condition) {
    _currentCondition = condition;
    notifyListeners();
  }


  @override
  void getCurrentCondition(int id) {
    _selectedGames.where((element) => element.id == id).forEach((element) {
      _currentCondition = element.conditionName ?? '';
    });
    notifyListeners();
  }

  @override
  String get currentCondition => _currentCondition;

}
