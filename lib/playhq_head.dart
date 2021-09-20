import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:places_service/places_service.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_routes.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/base_managers/error.dart';
import 'package:play_hq/services/base_managers/exceptions.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/view_models.dart';
import 'package:play_hq/widgets/loading_overlay_widget.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class PlayHqHead extends StatefulWidget {
  @override
  _PlayHqHeadState createState() => _PlayHqHeadState();
}

class _PlayHqHeadState extends State<PlayHqHead> {

  final errorHandler = locator<ErrorManager>();
  final _placesService = locator<PlacesService>();

  StreamSubscription? _errorSubscription;
  Stream<PlayHQException>? _prevErrorStream;

  @override
  void initState() {
    super.initState();

    if(_prevErrorStream != errorHandler.getErrorText){
      _prevErrorStream = errorHandler.getErrorText;
      _errorSubscription?.cancel();
      listenToErrors();
    }

    initHive();
    _placesService.initialize(apiKey: 'AIzaSyDGxXpv56r9r3jDvfWT6kYW_nFpU1T1xrQ');
  }

  void listenToErrors(){
    _errorSubscription = _prevErrorStream!.listen((error){
      locator<NavigationService>().showError(error);
    });
  }


  void initHive() async {
    final appDocumentaryDirectory = await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentaryDirectory.path);
    Hive.registerAdapter(GameDetailsAdapter());
  }

  @override
  void dispose() {
    Hive.close();
    _errorSubscription?.cancel();
    errorHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoadingOverlayModel>(
      create: (context) => ILoadingOverlay(),
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        scrollBehavior: CupertinoScrollBehavior(),
        theme: ThemeData(
          accentColor: PRIMARY_COLOR,
          canvasColor: Colors.transparent,
          backgroundColor: BACKGROUND_COLOR,
          accentColorBrightness: Brightness.light,
          primaryTextTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: Neusa,
            ),
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
              fontFamily: CircularBold,
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
              fontFamily: CircularBold,
              fontWeight: FontWeight.w600,
            ),
            bodyText2: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: CircularBook,
            ),
            subtitle1: TextStyle(
              fontSize: 8,
              color: Colors.white,
              fontFamily: CircularBold,
              fontWeight: FontWeight.w600,
            ),
            button: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: CircularBold,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        initialRoute: '/',
        builder: (context, child) {
          return LoadingWidget(
            child: child,
          );
        },
      ),
    );
  }
}
