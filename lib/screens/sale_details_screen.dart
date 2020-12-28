import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/custom_map_setter_widget.dart';
import 'package:play_hq/widgets/game_widget.dart';

class SaleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: ScreenUtils.bodyWidth,
                  height: ScreenUtils.getDesignHeight(240),
                  child: Stack(
                    children: [
                      Container(
                        width: ScreenUtils.bodyWidth,
                        height: ScreenUtils.getDesignHeight(240),
                        child: Image.asset('assets/images/cyberpunk2077.jpg',
                            fit: BoxFit.fill),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.6),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(child: Text('Cyperpunk 2077' , style: TextStyle(fontSize: 33 , fontWeight: FontWeight.bold , color: Colors.white , fontFamily: CircularBold),),),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text('GAME DETAILS' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Primary , fontFamily: Neusa),),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtils.bodyWidth,
                  height: ScreenUtils.getDesignHeight(100),
                  color: Color(0xff171B23),
                  child: Container(
                    margin: EdgeInsets.only(left: 24 , right: 24),
                    child: Row(
                      children: [
                        Container(
                          height: ScreenUtils.getDesignHeight(65),
                          width: ScreenUtils.getDesignWidth(65),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/user.jpg',
                              )
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Richard Kenwood' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),),
                              Text('08 Sales' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.6)),)
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: SvgPicture.asset('assets/icons/arrow-down.svg' , height: 15.0, width: 15.0,),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25) , left: 24),
                  child: Text('Location' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.8) , fontSize: 18 ,),),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15 , left: 24 , right: 24),
                    child: CustomMapSetterWidget()),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25) , left: 24),
                  child: Text('Sale Details' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.8) , fontSize: 18 ,),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24 , right: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                            child: Text('Negotiable' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1) , fontSize: 16 ,),),
                          ),
                          Spacer(),
                          Container(
                            child: SvgPicture.asset('assets/icons/tick.svg' , height: 15.0, width: 15.0,),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Text('Platform' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1) , fontSize: 16 ,),),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Text('PS4' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 16 , fontFamily: Neusa),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Text('Condition' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1) , fontSize: 16 ,),),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Text('MINT' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 16 , fontFamily: Neusa),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , left: 24 , right: 24),
                  child: Container(
                    height: ScreenUtils.getDesignHeight(40),
                    width: ScreenUtils.bodyWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Primary,
                    ),
                    child: Center(child: Text('BUY NOW (LKR 2500)' , style: TextStyle(fontSize: 16, fontFamily: Neusa , color: Colors.white),)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25) , left: 24),
                  child: Text('People also Viewed' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.8) , fontSize: 18 ,),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15 , left: 24 , right: 24 , bottom: 30),
                  height: ScreenUtils.getDesignHeight(160),
                  width: ScreenUtils.bodyWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Widgets for the Game cover with name and price
                      GamesWidget(
                        gameName: 'Ghost of Tsushima',
                        price: '4200 LKR',
                        backgroundUrl: 'assets/images/tshushima.jpg',
                      ),
                      GamesWidget(
                        gameName: 'COD Warzone',
                        price: '2900 LKR',
                        backgroundUrl: 'assets/images/warzone.jpg',
                      ),
                      GamesWidget(
                        gameName: 'Cyberpunk',
                        price: '2500 LKR',
                        backgroundUrl: 'assets/images/cyberpunk.jpg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
