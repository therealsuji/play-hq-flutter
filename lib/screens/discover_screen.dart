import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        child: Center(
          child: Text('This is the Discoer Screen'),
        ),
      )
    );
  }
}