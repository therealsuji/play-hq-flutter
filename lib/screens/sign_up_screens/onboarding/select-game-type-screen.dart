import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class GameTypes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40) , left: 24 , right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text('Let\'s get Started' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w500 , color: HEADER_TEXT_COLOR , fontFamily: Neusa),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text('Select what kind of games you like' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500 , color: HEADER_TEXT_COLOR.withOpacity(0.6) , fontFamily: CircularBook),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
