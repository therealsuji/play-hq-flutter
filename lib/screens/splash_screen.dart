import 'dart:async';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    ScreenUtils.setScreenSizes(context);
   }



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
