import 'package:places_service/places_service.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/view_models/custom_address_search/custom_address_search_model.dart';

class ICustomAddressSearchModel extends CustomAddressSearchModel {

  final _placesService = locator<PlacesService>();
  List<PlacesAutoCompleteResult> _autoCompleteResults = [];

  @override
  List<PlacesAutoCompleteResult> get autoCompleteResults => _autoCompleteResults;

  @override
  void setFormStatus(String val) {
    _getAutoCompleteResults(val);
  }

  Future<void> _getAutoCompleteResults(String val) async {
    if(val.isEmpty == false){

      final placesResult = await _placesService.getAutoComplete(val);

      if(placesResult.isEmpty == false){
        _autoCompleteResults = placesResult;
        notifyListeners();
      }

    }
  }



}