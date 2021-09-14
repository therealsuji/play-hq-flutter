import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:play_hq/view_models/onboarding/setup_sales_account_view_model/sales-account-model.dart';

class ISetupSalesModel extends SetupSalesModel{

  late var box;

  List<GameDetails> _selectedGames = [];
  String _selectedLocation = '';
  String _selectedMapLocationAddresss = '';

  @override
  void addSelectedGame(GameDetails game) async{
    box = await Hive.openBox('libraryGames');
    box.add(game);
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<GameDetails> get selectedGameList => _selectedGames;

  @override
  void dispose() {
    // TODO: implement dispose
    box.close();
    super.dispose();
  }

  @override
  void addLocation(String location) {
    _selectedLocation = location;
    notifyListeners();
    locator<NavigationService>().pop();
  }

  @override
  // TODO: implement selectedLocation
  String get selectedAddress => _selectedLocation;

  @override
  Future<void> selectedMapLocation(LatLng tappedPoint) async {
    var addresses = await GeocodingPlatform.instance.placemarkFromCoordinates(tappedPoint.latitude, tappedPoint.longitude);
    _selectedLocation = addresses[0].street.toString();
    locator<NavigationService>().pushNamed(SETUP_SALES_ACCOUNT_ROUTE);
    notifyListeners();
  }

}