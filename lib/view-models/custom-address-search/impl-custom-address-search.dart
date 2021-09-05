

import 'package:places_service/places_service.dart';
import 'package:places_service/src/models/application_models.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/view-models/custom-address-search/custom-address-search-model.dart';

class ImplCustomAddressSearch extends CustomAddressSearchModel {

  final _placesService = locator<PlacesService>();
  List<PlacesAutoCompleteResult> _autoCompleteResults = [];

  @override
  // TODO: implement autoCompleteResults
  List<PlacesAutoCompleteResult> get autoCompleteResults => _autoCompleteResults;

  @override
  void setFormStatus(String val) {
    // TODO: implement setFormStatus
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