import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/widgets/custom_body.dart';

import '../../helpers/app_screen_utils.dart';

class GameListScreen extends StatefulWidget {
  const GameListScreen({Key? key}) : super(key: key);

  @override
  _GameListScreenState createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: CustomBody(body: [
        Row(
          children: [
            // Back icon with Text 'Back'
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(Icons.arrow_back_ios , color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // Text 'Game List'
            Text(
              'Game List',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
          height: 50,
          color: Colors.white,
        )
      ]),
    );
  }
}
