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
                subtitle1: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.6),
                  fontFamily: CircularBook,
                ),
              ),
            platform: TargetPlatform.iOS,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRoutes.generateRoute,
          initialRoute: SplashScreenRoute),
    );
  }
}
