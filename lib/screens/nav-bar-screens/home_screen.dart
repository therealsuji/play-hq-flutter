import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
        child: Text('This is the home screen'),
      )
    );
  }

  Widget _myGameForSale() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: new ExactAssetImage('assets/images/girl.jpg'),
                    fit: BoxFit.cover,
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
//            bottom: 0,
            child: Container(
              height: ScreenUtils.getDesignHeight(120),
              width: ScreenUtils.bodyWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff091015), Colors.transparent],
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          Positioned.fill(
//            bottom: 0,
            child: Container(
              height: ScreenUtils.getDesignHeight(120),
              width: ScreenUtils.bodyWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff091015), Colors.transparent],
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20), bottom: ScreenUtils.getDesignHeight(20)),
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Games for Sale',
                  style: TextStyle(
                      fontFamily: CircularBold, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 1,
                    width: ScreenUtils.bodyWidth,
                    color: Colors.white.withOpacity(0.2)),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(16)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Game Title',
                              style: TextStyle(
                                  fontFamily: Neusa, fontSize: 14, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Horizon: Zero Dawn',
                                  style: TextStyle(fontFamily: CircularBook, fontSize: 14, color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Impressions',
                              style: TextStyle(
                                  fontFamily: Neusa, fontSize: 14, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  '20',
                                  style: TextStyle(fontFamily: CircularBook, fontSize: 14, color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          height: ScreenUtils.getDesignHeight(30),
                          width: ScreenUtils.getDesignWidth(80),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.0), color: PRIMARY_COLOR),
                          child: Center(
                            child: Text(
                              'VIEW ALL',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: Neusa),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
