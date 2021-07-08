import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashScreenModel>(context, listen: false).startAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.setScreenSizes(context);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        child: Center(
          child: Text(
            'This is the splash screen',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
