import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/loading-overlay/impl-loading-overlay.dart';
import 'package:play_hq/view-models/loading-overlay/loading-overlay-model.dart';
import 'package:play_hq/widgets/loading-overlay-widget.dart';
import 'package:provider/provider.dart';
import 'helpers/app-fonts.dart';
import 'helpers/app-routes.dart';
import 'helpers/app-service-locator.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class PlayHqHead extends StatefulWidget {
  @override
  _PlayHqHeadState createState() => _PlayHqHeadState();
}

class _PlayHqHeadState extends State<PlayHqHead> {
  @override
  void initState() {
    super.initState();

    initHive();
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
      create: (context) => ImplLoadingOverlay(),
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          accentColor: PRIMARY_COLOR,
          canvasColor: Colors.transparent,
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
            headline6: TextStyle(
              fontSize: 25,
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
