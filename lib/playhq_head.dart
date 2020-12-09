import 'package:flutter/material.dart';
import 'package:play_hq/blocs/auth_bloc.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'helpers/routes.dart';

class PlayHqHead extends StatelessWidget {
  static AuthBloc authBloc = new AuthBloc();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBloc>(
          create: (context) => AuthBloc(),
          dispose: (_, authBloc) => authBloc.dispose(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(
            //this is what you want
            accentColor: Primary,
            backgroundColor: Background,
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
          initialRoute: SplashScreenRoute),
    );
  }
}
