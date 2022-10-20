import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';

import '../../models/common_models/location_model.dart';
import '../../injection_container.dart';
import '../../services/nav_service.dart';
import 'custom_address_search_model.dart';

class ICustomAddressSearchModel extends CustomAddressSearchModel {
  final _placesService = sl<PlacesService>();
  List<PlacesAutoCompleteResult> _autoCompleteResults = [];

  String _selectedAddress = '';
  double _selectedLatitude = 0.0;
  double _selectedLongitude = 0.0;

  @override
  List<PlacesAutoCompleteResult> get autoCompleteResults => _autoCompleteResults;

  @override
  void setFormStatus(String val) {
    _getAutoCompleteResults(val);
  }

  Future<void> _getAutoCompleteResults(String val) async {
    if (val.isEmpty == false) {
      final placesResult = await _placesService.getAutoComplete(val);

      if (placesResult.isEmpty == false) {
        _autoCompleteResults = placesResult;
        notifyListeners();
      }
    }
  }

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

    notifyListeners();
  }

  @override
  void addLocation(String placeId, String address) async {
    _selectedAddress = address;

    PlacesDetails place = await _placesService.getPlaceDetails(placeId);

    _selectedLongitude = place.lng!;
    _selectedLatitude = place.lat!;

    LocationModel location = new LocationModel(
        address: _selectedAddress, lat: _selectedLatitude, long: _selectedLongitude);

    notifyListeners();
    sl<NavigationService>().pop(args: location);
  }
}
