import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'dart:math' as math;

import 'package:play_hq/widgets/game-widget.dart';

class GameDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
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
                          child: Image.asset('assets/images/ghost.png',
                              fit: BoxFit.fill),
                        ),
                        Container(
                          width: ScreenUtils.bodyWidth,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Container()
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtils.getDesignHeight(30), left: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Ghost of Tsushima',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Neusa,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                '25th July 2020',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: CircularBold,
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                'Sucker Punch Productions',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: CircularBold,
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: ScreenUtils.getDesignHeight(45),
                          width: ScreenUtils.getDesignWidth(90),
                          decoration: BoxDecoration(
                            color: PRIMARY_COLOR,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0) , bottomLeft: Radius.circular(5.0))
                          ),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('8/10' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white , fontFamily: CircularBold),),
                                ),
                                Icon(Icons.star , color: Color(0xffFFC107),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15 , left: 24 , right: 24),
                    child: Row(
                      children: [
                        // Widget to hold the platform
                        Container(
                          height: ScreenUtils.getDesignHeight(40),
                          width: ScreenUtils.getDesignWidth(55),
                          decoration: BoxDecoration(
                            color: Color(0xff171B23),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/playstation_logo.svg',),
                              Container(child: Text('PS4' , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , fontFamily: CircularBold , color: Color(0xff9290B1)),),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15 , left: 24 , right: 24),
                    child: Row(
                      children: [
                        Container(
                          height: ScreenUtils.getDesignHeight(25),
                          width: ScreenUtils.getDesignWidth(95),
                          decoration: BoxDecoration(
                              color: Color(0xff171B23),
                              borderRadius: BorderRadius.circular(3.0)
                          ),
                          child: Center(
                            child: Text('Action' , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , fontFamily: CircularBold , color: Color(0xff9290B1)
                            ),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: ScreenUtils.getDesignHeight(25),
                          width: ScreenUtils.getDesignWidth(95),
                          decoration: BoxDecoration(
                              color: Color(0xff171B23),
                              borderRadius: BorderRadius.circular(3.0)
                          ),
                          child: Center(
                            child: Text('Strategy' , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , fontFamily: CircularBold , color: Color(0xff9290B1)
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24 , right: 24 , top: 30),
                    width: ScreenUtils.bodyWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: ScreenUtils.getDesignWidth(155),
                          height: ScreenUtils.getDesignHeight(35),
                          decoration: BoxDecoration(
                            color: PRIMARY_COLOR,
                            borderRadius: BorderRadius.circular(3.0)
                          ),
                          child: Center(child: Text('Add to Library' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 14),)),
                        ),
                        Container(
                          width: ScreenUtils.getDesignWidth(155),
                          height: ScreenUtils.getDesignHeight(35),
                          decoration: BoxDecoration(
                              color: Color(0xffFFB238),
                              borderRadius: BorderRadius.circular(3.0)
                          ),
                          child: Center(child: Text('Add to Wishlist' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 14),)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , left: 24 , right: 24),
                    child: Text('Screenshots' , style: TextStyle(color: Color(0xffB5BDD5) , fontSize: 18 ,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15) , left: 24 , right: 24),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: ScreenUtils.getDesignHeight(115),
                            width: ScreenUtils.getDesignWidth(235),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset('assets/images/tsushima_screenshot_1.jpg' , fit: BoxFit.fill,)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            height: ScreenUtils.getDesignHeight(115),
                            width: ScreenUtils.getDesignWidth(235),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset('assets/images/screenshot2.png' , fit: BoxFit.fill,)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            height: ScreenUtils.getDesignHeight(115),
                            width: ScreenUtils.getDesignWidth(235),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset('assets/images/screenshot3.jpg' , fit: BoxFit.fill,)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , left: 24 , right: 24),
                    child: Text('Description' , style: TextStyle(color: Color(0xffB5BDD5) , fontSize: 18 ,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24 , right: 24 , top: 15),
                    child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat' , style: TextStyle(fontSize: 12 , color: Color(0xffB5BDD5).withOpacity(0.6)),),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 24 , right: 24),
                      child: _myGameForSale()),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , left: 24 , right: 24),
                    child: Text('Similar Games' , style: TextStyle(color: Color(0xffB5BDD5) , fontSize: 18 ,fontWeight: FontWeight.bold),),
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
                          price: '4000 LKR',
                          backgroundUrl: 'assets/images/tshushima.jpg',
                        ),
                        GamesWidget(
                          gameName: 'COD Warzone',
                          price: '2500 LKR',
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
        ));
  }
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
                  image: new ExactAssetImage('assets/images/arcade.jpg'),
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
                'Best Deals',
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
                            'Seller Name',
                            style: TextStyle(
                                fontFamily: Neusa, fontSize: 14, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                'Jacob Garfield',
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
                            'Price',
                            style: TextStyle(
                                fontFamily: Neusa, fontSize: 14, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                '2900 LKR',
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
                                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: Neusa),
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

Widget pillContainer({String name, bool isPlatform = false}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 5.0,
        spreadRadius: 4.0,
        offset: Offset(
          0.0,
          4.0, // vertical, move down 10
        ),
      )
    ], color: BottomNavColor, borderRadius: BorderRadius.circular(15)),
    child: Text(
      name,
      style: TextStyle(
        fontSize: isPlatform ? 18 : 15,
        color: Headertext.withOpacity(0.6),
        fontFamily: CircularBook,
      ),
    ),
  );
}

class GameDetailsHeader implements SliverPersistentHeaderDelegate {
  GameDetailsHeader({
    @required this.minHeight,
    @required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            height: ScreenUtils.getDesignHeight(280),
            child: Image.asset(
              'assets/images/ghost.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: double.infinity,
            height: ScreenUtils.getDesignHeight(280),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          ),
        ),
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(
                left: 15, right: 15, top: ScreenUtils.getDesignHeight(52)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            'assets/icons/back.svg',
                            color: Colors.white,
                          )),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              'assets/icons/notification.svg',
                              color: Colors.white,
                            )),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: PRIMARY_COLOR),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Text(
                          'Ghost of Tsushima',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontFamily: CircularBold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 5.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('July 17, 2020',
                            style: TextStyle(
                              fontSize: 22,
                              color: SubheadingText,
                              fontFamily: CircularBook,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text('Watch Trailer',
                            style: TextStyle(
                              fontSize: 18,
                              color: PRIMARY_COLOR,
                              fontFamily: CircularBold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: ScreenUtils.getDesignHeight(260),
          child: Container(
              height: 25,
              width: ScreenUtils.bodyWidth,
              decoration: BoxDecoration(
                  color: BACKGROUND_COLOR,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)))),
        )
      ],
    );
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration => throw UnimplementedError();

  @override
  // TODO: implement vsync
  TickerProvider get vsync => throw UnimplementedError();
}
