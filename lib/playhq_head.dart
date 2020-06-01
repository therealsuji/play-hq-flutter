import 'package:flutter/material.dart';
import 'package:play_hq/blocs/auth_bloc.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:provider/provider.dart';
import 'routes.dart';

class PlayHqHead extends StatelessWidget {
  static AuthBloc authBloc = new AuthBloc();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => authBloc,
          dispose: (_,authBloc)=>authBloc.dispose(),
        )
      ],
      child: MaterialApp(
          onGenerateRoute: MyRoutes.generateRoute,
          initialRoute: SplashScreenRoute),
    );
  }
}
