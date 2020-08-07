import 'package:flutter/material.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';

class GamesWidget extends StatelessWidget {

  final String backgroundUrl;
  final String gameName;
  final String price;

  GamesWidget({this.gameName, this.price,  this.backgroundUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(105),
      height:  ScreenUtils.getDesignHeight(160),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.75),
              blurRadius: 50.0,
              // has the effect of softening the shadow
              spreadRadius: 3.0,
              // has the effect of extending the shadow
              offset: Offset(
                1.0, // horizontal, move right 10
                1.0, // vertical, move down 10
              ),
            )
          ]
      ),
      child: Stack(
        children: [
          Container(
              height:  ScreenUtils.getDesignHeight(160),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.asset(backgroundUrl , fit: BoxFit.cover,))),
          Positioned(
            bottom: 0,
            child: Container(
              width: ScreenUtils.getDesignWidth(105),
              height:  ScreenUtils.getDesignHeight(140),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff091015),
                        Colors.transparent
                      ],begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  ),
                  borderRadius: BorderRadius.circular(3.0)
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(left: 9 , bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(gameName , style: TextStyle(fontFamily: CircularBook , fontSize: 14 , fontWeight: FontWeight.bold , color: Colors.white),),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(price , style: TextStyle(fontFamily: Neusa , fontSize: 12 , fontWeight: FontWeight.bold , color: Primary),))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
