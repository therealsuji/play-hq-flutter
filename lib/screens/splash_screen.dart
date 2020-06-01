import 'dart:async';
import 'package:flutter/material.dart';
import 'package:play_hq/blocs/auth_bloc.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/helpers/network_client.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthBloc _authBloc;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    NetworkClient(); // initialize the network client before doing any requests
    _authBloc = Provider.of<AuthBloc>(context);
    _authBloc.getAuthState().then((value) => value.listen((state) {
      if(state){
        Navigator.pushReplacementNamed(context, HomeRoute);
      }else{
        Navigator.pushReplacementNamed(context, LoginRoute);
      }
    }));
   }



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
