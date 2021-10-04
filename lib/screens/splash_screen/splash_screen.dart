import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/splash_screen/splash_screen_model.dart';
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
