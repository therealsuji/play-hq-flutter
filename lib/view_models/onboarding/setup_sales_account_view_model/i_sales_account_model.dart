import 'package:event_bus/event_bus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:play_hq/models/common_models/user_games_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/wishlist_games_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/repository/clients/setup_sales_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:play_hq/view_models/onboarding/setup_sales_account_view_model/sales-account-model.dart';

class ISetupSalesModel extends SetupSalesModel{

  late var box;

  final _setupSalesAPI = locator<SetupSalesRepository>();
  final _eventBus = locator<EventBus>();

  List<UserGamesModel> _selectedGames = [];
  String _selectedLocation = '';

  @override
  void addSelectedGame(UserGamesModel game) async{
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<UserGamesModel> get selectedGameList => _selectedGames;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void addLocation(String location) {
    _selectedLocation = location;
    notifyListeners();
    locator<NavigationService>().pop();
  }

  @override
  String get selectedAddress => _selectedLocation;

  @override
  Future<void> selectedMapLocation(LatLng tappedPoint) async {
    var addresses = await GeocodingPlatform.instance.placemarkFromCoordinates(tappedPoint.latitude, tappedPoint.longitude);
    _selectedLocation = addresses[0].street.toString();
    locator<NavigationService>().pushNamed(SETUP_SALES_ACCOUNT_ROUTE);
    notifyListeners();
  }

  @override
  void performAPIRequest() async{
    _eventBus.fire(LoadingEvent.show());

    var body = {
      "list": _selectedGames,
    };

    try{
      await _setupSalesAPI.setLibraryGames(body);
      _eventBus.fire(LoadingEvent.hide());
    }catch (e) {
      print(e.toString());
      _eventBus.fire(LoadingEvent.hide());
    }

  }



}