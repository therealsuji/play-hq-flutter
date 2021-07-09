import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/widgets/custom-app-bar-widget.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/custom-map-setter-widget.dart';
import 'package:play_hq/widgets/rasied-gradient-button-widget.dart';
import 'package:provider/provider.dart';

class CreateSaleScreen extends StatefulWidget {
  @override
  _CreateSaleScreenState createState() => _CreateSaleScreenState();
}

List<String> _platforms = [
  "PlayStation 4",
  "Xbox One",
  "Nintendo Switch",
  "Playstation 3",
  "Xbox 360",
];

class _CreateSaleScreenState extends State<CreateSaleScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Map<String, dynamic>> _gameCondition = [
    {"name": 'Used', "status": true},
    {"name": 'New', "status": false},
    {"name": 'Mint', "status": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: BACKGROUND_COLOR,
      appBar: CustomAppBarWidget(
        title: "Create Sale",
      ),
      body: Container()
    );
  }

}
