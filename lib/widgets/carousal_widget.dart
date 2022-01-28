import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class CarousalWidget extends StatelessWidget {

  final String? gameName;
  final String? price;
  final String? location;
  final String? backgroundUrl;
  final String? characterUrl;

  CarousalWidget({this.gameName, this.price, this.location, this.backgroundUrl, this.characterUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(240),
      margin: EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenUtils.getDesignHeight(200),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                        height: ScreenUtils.getDesignHeight(200),
                        width: ScreenUtils.bodyWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                             ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(
                              backgroundUrl!,
                              fit: BoxFit.cover,
                            ))),
                  ),
                  Positioned.fill(
                      child: Container(
                        height: ScreenUtils.getDesignHeight(175),
                        width: ScreenUtils.bodyWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.black.withOpacity(0.7)),
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      left: 24,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.75),
                                blurRadius: 30.0,
                                // has the effect of softening the shadow
                                spreadRadius: 10.0,
                                // has the effect of extending the shadow
                                offset: Offset(
                                  2.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Text(
                            gameName!,
                            style: TextStyle(
                                fontSize: 33,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: CircularBook),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.75),
                                blurRadius: 30.0,
                                // has the effect of softening the shadow
                                spreadRadius: 10.0,
                                // has the effect of extending the shadow
                                offset: Offset(
                                  2.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Text(
                            price!,
                            style: TextStyle(
                                fontSize: 20,
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.bold,
                                fontFamily: Neusa),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.75),
                                blurRadius: 30.0,
                                // has the effect of softening the shadow
                                spreadRadius: 10.0,
                                // has the effect of extending the shadow
                                offset: Offset(
                                  2.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Text(
                            location!,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.7),
                                fontFamily: CircularBook),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          height: ScreenUtils.getDesignHeight(30),
                          width: ScreenUtils.getDesignWidth(80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.75),
                                  blurRadius: 30.0,
                                  // has the effect of softening the shadow
                                  spreadRadius: 10.0,
                                  // has the effect of extending the shadow
                                  offset: Offset(
                                    2.0, // horizontal, move right 10
                                    2.0, // vertical, move down 10
                                  ),
                                )
                              ],
                              color: PRIMARY_COLOR
                          ),
                          child: Center(
                            child: Text(
                              'BUY NOW',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Neusa),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              child: Image.asset(characterUrl!),
            ),
          )
        ],
      ),
    );
  }
}
