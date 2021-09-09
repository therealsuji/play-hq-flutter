

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class CustomMapModel with ChangeNotifier{


  void handleTap(LatLng tappedPoint);

  void locatePosition();

  List<Marker> get markerPoint;




}