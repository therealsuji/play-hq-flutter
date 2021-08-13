import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';

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