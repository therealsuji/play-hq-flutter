
import 'package:event_bus/event_bus.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/models/common_models/location_model.dart';
import 'package:play_hq/models/sales/sales_model.dart';
import 'package:play_hq/repository/clients/sales_repository.dart';
import 'package:play_hq/service_locator.dart';
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

  bool _isAdded = false;

  List<GamePreferances> _selectedGames = [];

  DialogService _dialogService = locator<DialogService>();

  final _createSale = locator<SaleRepository>();

  ICreateSaleModel({GamePreferances? gamePreferances}) {
    if (gamePreferances?.id != null) {
      _selectedGames.add(gamePreferances!);
    }
  }

  @override
  get selectedPlatform => _selectedPlatform;

  @override
  bool get isNegotiable => _isNegotiable;

  @override
  double get price => _price;

  @override
  String get remarks => _remarks;

  @override
  void createSale() async {
    if(_isFormValid){
      locator<EventBus>().fire(LoadingEvent.show());
      LocationModel location = LocationModel(address: "SOMETIHING", lat: 123, long: 123);
      _selectedGames.forEach((element) {
        element.platform = _platformId;
      });
      SalesPayload createSaleModel = SalesPayload(
          location: location,
          price: _price,
          remarks: _remarks,
          negotiable: _isNegotiable,
          games: _selectedGames);
      try {
        await _createSale.createSale(createSaleModel);
        locator<EventBus>().fire(LoadingEvent.hide());
      } catch (e) {
        print(e.toString());
        locator<EventBus>().fire(LoadingEvent.hide());
      }
    }else{
      print('form is not valid');
      showDialog();
    }
  }

  Future showDialog() async {
    print('dialog called');
    var dialogResult = await _dialogService.showDialog(
      title: 'Nope, not yet :(',
      description: 'Please fill in all the required fields to create a sale',
      buttonTitle: 'Okay',
      type: AlertType.ERROR,
    );
    if (dialogResult.confirmed!) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
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
  void addSelectedGame(GamePreferances gamePreferances) {
      String conditionName = game_conditions.where((element) => element['API_Slug'] == gamePreferances.conditionName).first['name'] ?? '';
      gamePreferances = GamePreferances(game: gamePreferances.game, conditionId: conditionName , conditionName: gamePreferances.conditionName);
      getCurrentCondition(conditionName);
      validateForm();
      _selectedGames.add(gamePreferances);
    notifyListeners();
  }

  @override
  List<GamePreferances> get selectedGameList => _selectedGames;

  @override
  int get platformId => _platformId;

  @override
  void removeGame(int id) {
    _selectedGames.removeWhere((game) => game.game.apiId == id);
    validateForm();
    notifyListeners();
    locator<NavigationService>().pop();
  }

  @override
  void updateGame(int id){
    _selectedGames.firstWhere((element) => id == element.game.apiId).conditionId = _currentCondition;
    notifyListeners();
    locator<NavigationService>().pop();
  }

  @override
  void changeCurrentCondition(String condition) {
    _currentCondition = condition;
    notifyListeners();
  }

  void getCurrentCondition(String name) {
    _currentCondition = name;
    notifyListeners();
  }

  @override
  String get currentCondition => _currentCondition;

  @override
  void checkGame(GamePreferances gamePreferances) {
    int length = _selectedGames.where((element) => element.game.apiId == gamePreferances.game.apiId).length;
    if(length > 0){
      _isAdded = true;
    }else{
      _isAdded = false;
    }
    print('Is Added $isAdded');
    notifyListeners();
  }

  @override
  bool get isAdded => _isAdded;

}
