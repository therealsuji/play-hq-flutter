import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/view-models/custom-map/custom-map-model.dart';
import 'package:play_hq/view-models/onboarding/setup-sales-account-view-model/sales-account-model.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:provider/provider.dart';

class CustomMapScreen extends StatefulWidget {
  const CustomMapScreen({Key? key}) : super(key: key);

  @override
  _CustomMapScreenState createState() => _CustomMapScreenState();
}

class _CustomMapScreenState extends State<CustomMapScreen> {

  Completer<GoogleMapController> _googleMapController = Completer();
  GoogleMapController? newGoogleMapController;

  static final CameraPosition _googlePlex = CameraPosition(target : LatLng(6.9271 , 79.8612), zoom: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Consumer<CustomMapModel>(
              builder: (_ , val , __){
                return GoogleMap(
                  initialCameraPosition: _googlePlex,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller){
                    _googleMapController.complete(controller);
                    newGoogleMapController = controller;
                    newGoogleMapController?.setMapStyle(mapStyle);
                    Provider.of<CustomMapModel>(context , listen: false).locatePosition();
                  },
                  markers: Set.from(val.markerPoint),
                  onTap: (onTapped){
                    Provider.of<CustomMapModel>(context , listen: false).handleTap(onTapped);
                    Provider.of<SetupSalesModel>(context , listen: false).selectedMapLocation(onTapped);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
