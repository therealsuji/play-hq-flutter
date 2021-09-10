
import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/view-models/custom-map/custom-map-model.dart';

class ImplCustomMap extends CustomMapModel {

  List<Marker> _markerPoint = [];

  GoogleMapController? newGoogleMapController;

  Position? currentPosition;

  @override
  void handleTap(LatLng tappedPoint) {
    _markerPoint = [];
    _markerPoint.add(Marker(markerId: MarkerId(tappedPoint.toString()) , position: tappedPoint , draggable: true , onDragEnd: (dragEndPosition){
      print(dragEndPosition);
    }));
    notifyListeners();
  }

  @override
  void locatePosition() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latestPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(target: latestPosition , zoom: 14.0);
    newGoogleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    notifyListeners();
  }

  @override
  // TODO: implement markerPoint
  List<Marker> get markerPoint => _markerPoint;


}