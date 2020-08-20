import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'dart:math' as math;

class GameDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Background,
        body: CustomScrollView(
          slivers: [
//            SliverPersistentHeader(
//              pinned: true,
//              floating: false,
//              delegate: GameDetailsHeader(maxHeight: 225, minHeight: 100),
//            ),
//            SliverAppBar(
//              pinned: true,
//              expandedHeight: 200,
//              title: Text('Title'),
//              stretch: true,
//              flexibleSpace: GameDetailsHeader(context),
//            ),
            SliverAppBar(
              backgroundColor: Background,
              elevation: 0.0,
              pinned: true,
              expandedHeight: 200,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
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
                              height: 25,
                              width: 25,
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
                                  shape: BoxShape.circle, color: Primary),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                            color: Primary,
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
                stretchModes: [
                  StretchMode.blurBackground
                ],
                background: Image.asset('assets/images/ghost.png', fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    decoration: BoxDecoration(
                        color: Background,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: ScreenUtils.getDesignWidth(250),
                              child: Wrap(
                                spacing: 15,
                                runSpacing: 10,
                                children: [
                                  pillContainer(isPlatform: true, name: "PS4"),
                                ],
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Primary,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 5.0,
                                      spreadRadius: 4.0,
                                      offset: Offset(
                                        0.0,
                                        4.0, // vertical, move down 10
                                      ),
                                    )
                                  ]),
                              alignment: Alignment.center,
                              child: Text(
                                "9.3/10",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: CircularBold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Wrap(
                            spacing: 15,
                            runSpacing: 10,
                            children: [
                              pillContainer(name: "Adventure"),
                              pillContainer(name: "Stealth "),
                              pillContainer(name: "Action"),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: BottomNavColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5.0,
                                  spreadRadius: 4.0,
                                  offset: Offset(
                                    0.0,
                                    4.0, // vertical, move down 10
                                  ),
                                )
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Add to Game Library',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Primary,
                                        fontFamily: CircularBook,
                                      )),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Container(
                                  color: Colors.white,
                                  width: 2,
                                  height: 20,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text('Add to Wishlist',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Headertext,
                                        fontFamily: CircularBook,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("Best Deals",
                            style: TextStyle(
                              fontSize: 18,
                              color: Headertext,
                              fontFamily: CircularBook,
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: BottomNavColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5.0,
                                  spreadRadius: 4.0,
                                  offset: Offset(
                                    0.0,
                                    4.0, // vertical, move down 10
                                  ),
                                )
                              ]),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      ExactAssetImage('assets/images/download.jpg'),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: [
                                          Text('Jeremy Harper',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Headertext,
                                                fontFamily: CircularBook,
                                              )),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '4.6',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: SvgPicture.asset(
                                                    'assets/icons/star.svg',
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                                ),
                                                Text(
                                                  '(30)',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'LKR 5000',
                                      style: TextStyle(
                                          color: Pricetext,
                                          fontSize: 18,
                                          fontFamily: Neusa),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("Description",
                            style: TextStyle(
                              fontSize: 18,
                              color: Headertext,
                              fontFamily: CircularBook,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat",
                            style: TextStyle(
                              fontSize: 14,
                              color: Headertext.withOpacity(0.4),
                              fontFamily: CircularBook,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

Widget innerWidget(context) {
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
        child: Padding(
          padding: EdgeInsets.only(
              left: 24, right: 24, top: ScreenUtils.getDesignHeight(52)),
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
                        height: 25,
                        width: 25,
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
                            shape: BoxShape.circle, color: Primary),
                      ),
                    ],
                  ),
                ],
              ),
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
                      color: Primary,
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
      ),
      Container(
        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(270)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          decoration: BoxDecoration(
              color: Background,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ScreenUtils.getDesignWidth(250),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 10,
                      children: [
                        pillContainer(isPlatform: true, name: "PS4"),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 5.0,
                            spreadRadius: 4.0,
                            offset: Offset(
                              0.0,
                              4.0, // vertical, move down 10
                            ),
                          )
                        ]),
                    alignment: Alignment.center,
                    child: Text(
                      "9.3/10",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: CircularBold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: [
                    pillContainer(name: "Adventure"),
                    pillContainer(name: "Stealth "),
                    pillContainer(name: "Action"),
                  ],
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: BottomNavColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5.0,
                        spreadRadius: 4.0,
                        offset: Offset(
                          0.0,
                          4.0, // vertical, move down 10
                        ),
                      )
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Add to Game Library',
                            style: TextStyle(
                              fontSize: 15,
                              color: Primary,
                              fontFamily: CircularBook,
                            )),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.white,
                        width: 2,
                        height: 20,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text('Add to Wishlist',
                            style: TextStyle(
                              fontSize: 15,
                              color: Headertext,
                              fontFamily: CircularBook,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Best Deals",
                  style: TextStyle(
                    fontSize: 18,
                    color: Headertext,
                    fontFamily: CircularBook,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: BottomNavColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5.0,
                        spreadRadius: 4.0,
                        offset: Offset(
                          0.0,
                          4.0, // vertical, move down 10
                        ),
                      )
                    ]),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            ExactAssetImage('assets/images/download.jpg'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Text('Jeremy Harper',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Headertext,
                                      fontFamily: CircularBook,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        '4.6',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: SvgPicture.asset(
                                          'assets/icons/star.svg',
                                          height: 15,
                                          width: 15,
                                        ),
                                      ),
                                      Text(
                                        '(30)',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            'LKR 5000',
                            style: TextStyle(
                                color: Pricetext,
                                fontSize: 18,
                                fontFamily: Neusa),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text("Description",
                  style: TextStyle(
                    fontSize: 18,
                    color: Headertext,
                    fontFamily: CircularBook,
                  )),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat",
                  style: TextStyle(
                    fontSize: 14,
                    color: Headertext.withOpacity(0.4),
                    fontFamily: CircularBook,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ],
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
Widget GameDetailsHeader(BuildContext context){
    return Stack(
      fit: StackFit.expand,
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
          child: Padding(
            padding: EdgeInsets.only(
                left: 24, right: 24, top: ScreenUtils.getDesignHeight(52)),
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
                          height: 25,
                          width: 25,
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
                              shape: BoxShape.circle, color: Primary),
                        ),
                      ],
                    ),
                  ],
                ),
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
                        color: Primary,
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
        ),
      ],
    );
}

//class GameDetailsHeader implements SliverPersistentHeaderDelegate {
//  GameDetailsHeader({
//    @required this.minHeight,
//    @required this.maxHeight,
//  });
//
//  final double minHeight;
//  final double maxHeight;
//
//  @override
//  Widget build(
//      BuildContext context, double shrinkOffset, bool overlapsContent) {
//    return Stack(
//      fit: StackFit.expand,
//      children: [
//        Positioned(
//          child: Container(
//            width: double.infinity,
//            height: ScreenUtils.getDesignHeight(280),
//            child: Image.asset(
//              'assets/images/ghost.png',
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
//        Positioned(
//          child: Padding(
//            padding: EdgeInsets.only(
//                left: 24, right: 24, top: ScreenUtils.getDesignHeight(52)),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [
//                    GestureDetector(
//                      onTap: () {
//                        Navigator.pop(context);
//                      },
//                      child: Container(
//                          height: 25,
//                          width: 25,
//                          child: SvgPicture.asset(
//                            'assets/icons/back.svg',
//                            color: Colors.white,
//                          )),
//                    ),
//                    Stack(
//                      children: [
//                        SizedBox(
//                            height: 25,
//                            width: 25,
//                            child: SvgPicture.asset(
//                              'assets/icons/notification.svg',
//                              color: Colors.white,
//                            )),
//                        Container(
//                          height: 8,
//                          width: 8,
//                          decoration: BoxDecoration(
//                              shape: BoxShape.circle, color: Primary),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 35),
//                  child: Text(
//                    'Ghost of Tsushima',
//                    style: TextStyle(
//                      fontSize: 28,
//                      color: Colors.white,
//                      fontFamily: CircularBold,
//                      shadows: <Shadow>[
//                        Shadow(
//                          offset: Offset(0.0, 3.0),
//                          blurRadius: 5.0,
//                          color: Colors.black.withOpacity(0.5),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 5),
//                  child: Text('July 17, 2020',
//                      style: TextStyle(
//                        fontSize: 22,
//                        color: SubheadingText,
//                        fontFamily: CircularBook,
//                        shadows: <Shadow>[
//                          Shadow(
//                            offset: Offset(0.0, 3.0),
//                            blurRadius: 5.0,
//                            color: Colors.black.withOpacity(0.5),
//                          ),
//                        ],
//                      )),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 15),
//                  child: Text('Watch Trailer',
//                      style: TextStyle(
//                        fontSize: 18,
//                        color: Primary,
//                        fontFamily: CircularBold,
//                        shadows: <Shadow>[
//                          Shadow(
//                            offset: Offset(0.0, 3.0),
//                            blurRadius: 5.0,
//                            color: Colors.black.withOpacity(0.5),
//                          ),
//                        ],
//                      )),
//                )
//              ],
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//  @override
//  double get minExtent => minHeight;
//
//  @override
//  double get maxExtent => math.max(maxHeight, minHeight);
//
//  @override
//  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//    return true;
//  }
//
//  @override
//  FloatingHeaderSnapConfiguration get snapConfiguration => null;
//
//  @override
//  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
//}
