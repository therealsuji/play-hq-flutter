import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'helpers/app-fonts.dart';
import 'helpers/app-routes.dart';

class PlayHqHead extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          //this is what you want
          accentColor: Primary,
          backgroundColor: BACKGROUND_COLOR,
          accentColorBrightness: Brightness.light,
          primaryTextTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontFamily: Neusa,
            ),
            headline2: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.6),
              fontFamily: CircularBook,
            ),
            subtitle1: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.6),
              fontFamily: CircularBook,
            ),
            subtitle2: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: CircularBook,
            ),
            headline3: TextStyle(
              fontSize: 18,
              color: Color(0xffB5BDD5).withOpacity(0.8),
              fontFamily: CircularBold,
            ),
          ),
          platform: TargetPlatform.iOS,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        initialRoute: MAIN_SCREEN);
  }
}
