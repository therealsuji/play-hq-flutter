import 'package:event_bus/event_bus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:places_service/places_service.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/common_models/location_model.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/models/onboarding_models/setup_sales_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/repository/clients/setup_sales_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:play_hq/view_models/onboarding/setup_sales_account_view_model/sales-account-model.dart';

class ISetupSalesModel extends SetupSalesViewModel{

  late var box;
  final _setupSalesAPI = locator<SetupSalesRepository>();
  final _eventBus = locator<EventBus>();
  final _placesService = locator<PlacesService>();

  List<GamePreferances> _selectedGames = [];

  String _selectedAddress = '';
  double _selectedLatitude = 0.0;
  double _selectedLongitude = 0.0;

  String _mobileNumber = '';
  String _displayName = '';
  String _fullName = '';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void addLocation(String placeId , String address) async{
    _selectedAddress = address;

    PlacesDetails place = await _placesService.getPlaceDetails(placeId);

    _selectedLongitude = place.lng!;
    _selectedLatitude = place.lat!;

    notifyListeners();
    locator<NavigationService>().pop();
  }

  @override
  String get selectedAddress => _selectedAddress;

  @override
  Future<void> selectedMapLocation(LatLng tappedPoint) async {
    var addresses = await GeocodingPlatform.instance.placemarkFromCoordinates(tappedPoint.latitude, tappedPoint.longitude);
    _selectedAddress = addresses[0].street.toString();
    _selectedLatitude = tappedPoint.latitude;
    _selectedLongitude = tappedPoint.longitude;
    notifyListeners();
  }

  @override
  void performAPIRequest() async{
    _eventBus.fire(LoadingEvent.show());

    try{
      await _setupSalesAPI.setLibraryGames(_selectedGames);

      _fullName = await SecureStorage.readValue("displayName") ?? '';

      LocationModel locationModel = LocationModel(
        address: _selectedAddress,
        lat: _selectedLatitude,
        long: _selectedLongitude,
      );

      SetupSalesModel _setupSalesModel = SetupSalesModel(
        phoneNumber: _mobileNumber,
        displayName: _displayName,
        fullName: _fullName,
        location: locationModel,
      );

      await _setupSalesAPI.setProfileDetails(_setupSalesModel);

      locator<NavigationService>().pushNamed(MAIN_SCREEN);

      _eventBus.fire(LoadingEvent.hide());
    }catch (e) {
      print(e.toString());
      _eventBus.fire(LoadingEvent.hide());
    }

  }

  @override
  void addSelectedGame(GamePreferances game) {
    _selectedGames.add(game);
    notifyListeners();
    locator<NavigationService>().pushNamed(SETUP_SALES_ACCOUNT_ROUTE);
  }

  @override
  List<GamePreferances> get selectedGameList => _selectedGames;

  @override
  void addDisplayName(String displayName) {
    _displayName = displayName;
    notifyListeners();
  }

  @override
  void addPhoneNumber(String phoneNumber) {
    _mobileNumber = phoneNumber;
    notifyListeners();
  }



}