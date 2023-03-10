import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:places_service/places_service.dart';
import 'package:play_hq/repository/clients/user_repository.dart';
import 'package:play_hq/services/base_managers/response_manager.dart';

import '../../../helpers/app_save_locally.dart';
import '../../../helpers/app_secure_storage.dart';
import '../../../helpers/app_strings.dart';
import '../../../models/common_models/game_preferences/request_body.dart';
import '../../../models/common_models/location_model.dart';
import '../../../models/common_models/user/user_details.dart';
import '../../../models/common_models/user/user_preferences.dart';
import '../../../models/loading_event_model.dart';
import '../../../repository/clients/setup_sales_repository.dart';
import '../../../injection_container.dart';
import '../../../services/auth_service.dart';
import '../../../services/nav_service.dart';
import 'sales-account-model.dart';

class ISetupSalesModel extends SetupSalesViewModel {
  late var box;
  final _setupSalesAPI = sl<SetupSalesRepository>();
  final _eventBus = sl<EventBus>();
  final _placesService = sl<PlacesService>();

  final _userAPi = sl<UserRepository>();

  List<GamePreferencesRequest> _selectedGames = [];

  String _selectedAddress = '';
  double _selectedLatitude = 0.0;
  double _selectedLongitude = 0.0;

  String _mobileNumber = '';
  String _displayName = '';
  String _fullName = '';

  @override
  void dispose() {
    // Not sure what to do about this
    // disposing this causes the provider to be not available when you go forward sales purchase come back to account and go forward again
    // TODO : LOOK INTO THIS
    // super.dispose();
  }

  @override
  void addLocation(LocationModel model) async {
    _selectedAddress = model.address ?? '';
    _selectedLongitude = model.long ?? 0;
    _selectedLatitude = model.lat ?? 0;
    notifyListeners();
  }

  @override
  String get selectedAddress => _selectedAddress;

  @override
  Future<void> selectedMapLocation(LatLng tappedPoint) async {
    var addresses = await GeocodingPlatform.instance
        .placemarkFromCoordinates(tappedPoint.latitude, tappedPoint.longitude);
    _selectedAddress = addresses[0].street.toString();
    _selectedLatitude = tappedPoint.latitude;
    _selectedLongitude = tappedPoint.longitude;

    LocationModel location = new LocationModel(
        address: _selectedAddress, lat: _selectedLatitude, long: _selectedLongitude);

    print('This is the location address ${location.address}');

    AppSharedPreferences().createLocalData('location', location);

    notifyListeners();
  }

  @override
  void performAPIRequest() async {
    _eventBus.fire(LoadingEvent.show());

    UserDetails userDetails = await sl<AuthService>().getUserDetails();
    _fullName = await SecureStorage.readValue("displayName") ?? '';

    LocationModel locationModel = LocationModel(
      address: _selectedAddress,
      lat: _selectedLatitude,
      long: _selectedLongitude,
    );

    var body = {
      'name': userDetails.name,
      'displayName': _displayName,
      'phoneNumber': _mobileNumber,
      'location': locationModel
    };
    try {
      bool value = await _userAPi.addLibraryGames(_selectedGames);

      if(value){
        Response value = await _userAPi.updateUserDetails(body);
        if(value.statusCode >= 200 && value.statusCode < 300){
          _eventBus.fire(LoadingEvent.hide());
          sl<ResponseManager>().showResponse('Details Added Successfully', Colors.green);
          sl<NavigationService>().pushReplacement(MAIN_SCREEN);
        }
      }
    } catch (e) {
      print(e.toString());
      _eventBus.fire(LoadingEvent.hide());
      sl<ResponseManager>().showResponse('Something went wrong, please try again', Colors.redAccent);
    }
  }

  @override
  void addSelectedGame(GamePreferencesRequest game) {
    _selectedGames.add(game);
    notifyListeners();
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
