import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScreenUtils.setScreenSizes(context);
      Provider.of<SplashScreenModel>(context, listen: false).changeScreen();
    });

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        child: Center(
          child: Text('This is the splash screen' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
