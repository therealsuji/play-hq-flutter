import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:places_service/places_service.dart';
import 'package:provider/provider.dart';

import 'helpers/app_colors.dart';
import 'helpers/app_fonts.dart';
import 'helpers/app_routes.dart';
import 'managers/dialog_manager.dart';
import 'models/search_model/app_search_game_model.dart';
import 'injection_container.dart';
import 'services/nav_service.dart';
import 'view_models/view_models.dart';
import 'widgets/loading_overlay_widget.dart';

class PlayHqHead extends StatefulWidget {
  @override
  _PlayHqHeadState createState() => _PlayHqHeadState();
}

class _PlayHqHeadState extends State<PlayHqHead> {
  final _placesService = sl<PlacesService>();

  @override
  void initState() {
    super.initState();

    initHive();
    _placesService.initialize(apiKey: 'AIzaSyDGxXpv56r9r3jDvfWT6kYW_nFpU1T1xrQ');
  }

  void initHive() async {
    final appDocumentaryDirectory = await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentaryDirectory.path);
    Hive.registerAdapter(GameDetailsAdapter());
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoadingOverlayModel>(
      create: (context) => ILoadingOverlay(),
      child: MaterialApp(
        navigatorKey: sl<NavigationService>().navigatorKey,
        scrollBehavior: CupertinoScrollBehavior(),
        theme: ThemeData(
          accentColor: PRIMARY_COLOR,
          canvasColor: Colors.transparent,
          backgroundColor: BACKGROUND_COLOR,
          accentColorBrightness: Brightness.light,
          primaryTextTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 25, color: Colors.white, fontFamily: Neusa, fontWeight: FontWeight.bold),
            headline2: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: Neusa,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: Neusa,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: Neusa,
              fontWeight: FontWeight.bold,
            ),
            headline5: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: CircularBook,
            ),
            headline6: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: Neusa,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: CircularBook,
              fontWeight: FontWeight.w600,
            ),
            bodyText2: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: CircularBook,
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(
              fontSize: 8,
              color: Colors.white,
              fontFamily: CircularBook,
              fontWeight: FontWeight.w600,
            ),
            button: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: CircularBook,
              fontWeight: FontWeight.bold,
            ),
            subtitle2: TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontFamily: CircularBook,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        initialRoute: '/',
        builder: (context, child) {
          return Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => DialogManager(
                  child: LoadingWidget(
                    child: child,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
