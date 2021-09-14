import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Center(
          child: GestureDetector(
            onTap: () {
              // TODO: PUT THIS IN A VIEW MODEL METHOD
              locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN);
            },
            child: Container(
              height: ScreenUtils.getDesignHeight(30),
              width: ScreenUtils.getDesignWidth(80),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.0), color: PRIMARY_COLOR),
              child: Center(
                child: Text(
                  'VIEW ALL',
                  style: TextStyle(
                      fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: Neusa),
                ),
              ),
            ),
          ),
        ),
    );
  }
}