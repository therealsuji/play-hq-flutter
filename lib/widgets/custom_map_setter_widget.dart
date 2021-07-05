import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

import 'custom_button_widget.dart';

class CustomMapSetterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ScreenUtils.getDesignHeight(170),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(10)),
          decoration: BoxDecoration(color: BottomNavColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AbsorbPointer(
                absorbing: true,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: ScreenUtils.getDesignHeight(16)),
                  height: ScreenUtils.getDesignHeight(92),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      zoomControlsEnabled: false,
                      initialCameraPosition:
                          CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 10),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/location.svg'),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(10)),
                        child: Text(
                          'No 2 6th Lane Colombo 2 ',
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                        ),
                      )
                    ],
                  ),
                  Container(
                      height: ScreenUtils.getDesignHeight(30),
                      width: ScreenUtils.getDesignWidth(96),
                      child: CustomButton(
                        buttonText: "Set On Map",
                        textFontSize: 14,
                        onPressed: () {},
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
