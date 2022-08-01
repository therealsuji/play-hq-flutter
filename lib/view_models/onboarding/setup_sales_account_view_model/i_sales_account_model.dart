import 'dart:convert';

import 'package:event_bus/event_bus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:places_service/places_service.dart';
import 'package:play_hq/helpers/app_save_locally.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/common_models/location_model.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/onboarding_models/setup_sales_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/repository/clients/setup_sales_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:play_hq/view_models/onboarding/setup_sales_account_view_model/sales-account-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ISetupSalesModel extends SetupSalesViewModel{

  late var box;
  final _setupSalesAPI = locator<SetupSalesRepository>();
  final _eventBus = locator<EventBus>();
  final _placesService = locator<PlacesService>();

  List<GamePreferencesRequest> _selectedGames = [];

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

    LocationModel location = new LocationModel(address: _selectedAddress , lat: _selectedLatitude , long: _selectedLongitude);

    AppSharedPreferences().createLocalData('location', location);

    notifyListeners();
    locator<NavigationService>().pushNamed(SALES_ACCOUNT_SCREEN);
  }

  @override
  String get selectedAddress => _selectedAddress;

  @override
  Future<void> selectedMapLocation(LatLng tappedPoint) async {
    var addresses = await GeocodingPlatform.instance.placemarkFromCoordinates(tappedPoint.latitude, tappedPoint.longitude);
    _selectedAddress = addresses[0].street.toString();
    _selectedLatitude = tappedPoint.latitude;
    _selectedLongitude = tappedPoint.longitude;

    LocationModel location = new LocationModel(address: _selectedAddress , lat: _selectedLatitude , long: _selectedLongitude);

    print('This is the location address ${location.address}');

    AppSharedPreferences().createLocalData('location', location);

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

      var names = _fullName.split(' ');
      String firstName = names[0];
      String lastName = names[1];

      SetupSalesModel _setupSalesModel = SetupSalesModel(
        phoneNumber: _mobileNumber,
        displayName: _displayName,
        firstName: firstName,
        lastName: lastName,
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
  void addSelectedGame(GamePreferencesRequest game) {
    _selectedGames.add(game);
    notifyListeners();
    locator<NavigationService>().pushNamed(SETUP_SALES_ACCOUNT_ROUTE);
  }

  @override
  List<GamePreferencesRequest> get selectedGameList => _selectedGames;

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