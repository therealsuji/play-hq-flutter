import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/auth_service.dart';
import 'package:play_hq/services/nav_service.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: OutlinedButton(
          onPressed: () async {
            locator<AuthService>().logOut();
            locator<NavigationService>().pushAndRemoveUntil(SIGN_UP_SCREEN);
          },
          child: Text("Log Out"),
        ),
      ),
    );
  }
}
