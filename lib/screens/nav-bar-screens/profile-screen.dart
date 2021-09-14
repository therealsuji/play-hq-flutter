import 'package:flutter/material.dart';
import 'package:play_hq/service-locator.dart';
import 'package:play_hq/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            locator<AuthService>().logOut();
          },
          child: Text("Log Out"),
        ),
      ),
    );
  }
}
