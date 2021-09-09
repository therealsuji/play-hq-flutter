

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';

abstract class CustomAddressSearchModel with ChangeNotifier {

  void setFormStatus(String val);

  List<PlacesAutoCompleteResult> get autoCompleteResults;

}