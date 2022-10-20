import 'package:event_bus/event_bus.dart';

import '../../../helpers/app_constants.dart';
import '../../../helpers/app_enums.dart';
import '../../../helpers/app_strings.dart';
import '../../../models/common_models/location_model.dart';
import '../../../models/loading_event_model.dart';
import '../../../models/sales/sales_payload_model.dart';
import '../../../repository/clients/sales_repository.dart';
import '../../../injection_container.dart';
import '../../../services/dialog_service.dart';
import '../../../services/nav_service.dart';
import 'create_sale_model.dart';

class ICreateSaleModel extends CreateSaleModel {
  bool _isNegotiable = false;
  double _price = 0;
  String _remarks = '';
  bool _isFormValid = false;

  int _selectedPlatform = 10;
  int _platformId = 0;

  String _currentCondition = '';

  bool _isAdded = false;

  List<GameElement> _selectedGames = [];

  DialogService _dialogService = sl<DialogService>();

  final _createSale = sl<SaleRepository>();

  ICreateSaleModel({GameElement? gamePreferances}) {
    if (gamePreferances?.game.apiId != null) {
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
    if (_isFormValid) {
      sl<EventBus>().fire(LoadingEvent.show());
      LocationModel location = LocationModel(address: "Something", lat: 123, long: 123);
      SalesPayload createSaleModel = SalesPayload(
          gameList: _selectedGames,
          platform: _platformId,
          location: location,
          price: _price,
          remarks: _remarks,
          negotiable: _isNegotiable);
      try {
        await _createSale.createSale(createSaleModel);
        sl<EventBus>().fire(LoadingEvent.hide());
        successSale();
      } catch (e) {
        print(e.toString());
        sl<EventBus>().fire(LoadingEvent.hide());
      }
    } else {
      print('form is not valid');
      showDialog();
    }
  }

  Future successSale() async {
    var dialogResult = await _dialogService.showDialog(
      title: 'Alright we got your sale',
      description: 'We will send you notification when someone wants to buy your game',
      buttonTitle: 'Back to Home',
      type: AlertType.SUCCESS,
      onPressed: () {
        sl<NavigationService>().pushNamed(MAIN_SCREEN);
      },
    );
    if (dialogResult.confirmed!) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
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
    _isFormValid = _price > 0 && _selectedPlatform != 10 && _selectedGames.length > 0;
    notifyListeners();
  }

  @override
  void addSelectedGame(GameElement gameElement) {
    String conditionName = game_conditions
            .where((element) => element['API_Slug'] == gameElement.status)
            .first['name'] ??
        '';
    gameElement =
        GameElement(game: gameElement.game, status: gameElement.status, statusName: conditionName);
    getCurrentCondition(conditionName);
    validateForm();
    _selectedGames.add(gameElement);
    notifyListeners();
  }

  @override
  List<GameElement> get selectedGameList => _selectedGames;

  @override
  int get platformId => _platformId;

  @override
  void removeGame(int id) {
    _selectedGames.removeWhere((game) => game.game.apiId == id);
    validateForm();
    sl<NavigationService>().pop();
    notifyListeners();
  }

  @override
  void updateGame(int id) {
    _selectedGames.firstWhere((element) => id == element.game.apiId).statusName = _currentCondition;
    notifyListeners();
    sl<NavigationService>().pop();
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
  void checkGame(GameElement gameElement) {
    int length =
        _selectedGames.where((element) => element.game.apiId == gameElement.game.apiId).length;
    if (length > 0) {
      _isAdded = true;
    } else {
      _isAdded = false;
    }
    print('Is Added $isAdded');
    notifyListeners();
  }

  @override
  bool get isAdded => _isAdded;

  @override
  int get gameCount => _selectedGames.length;
}
