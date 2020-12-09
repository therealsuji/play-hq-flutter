import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/blocs/auth_bloc.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/carousal_widget.dart';
import 'package:play_hq/widgets/game_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthBloc _authBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authBloc = Provider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      body: SingleChildScrollView(
        // DO THE BOUNCY THANGG
//        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 51),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: CircularBold),
                  ),
                  Spacer(),
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: Colors.white,
                      )),
                  Container(width: ScreenUtils.getDesignWidth(40)),
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        'assets/icons/notification.svg',
                        color: Colors.white,
                      )),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Get the best deals on the latest games',
                    style: TextStyle(fontFamily: CircularBook, fontSize: 14, color: Colors.white.withOpacity(0.7)),
                  )),
              //Custom Widget for the carousal Slider
              CarousalWidget(
                gameName: 'Fortnite',
                price: 'LKR 2000',
                location: 'Colombo 07',
                backgroundUrl: 'assets/images/Fortnite.jpg',
                characterUrl: 'assets/images/fortnite.png',
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Text(
                  'From your Wishlist',
                  style: TextStyle(fontSize: 18, fontFamily: CircularBold, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
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
              _myGameForSale(),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Text(
                  'Suggested for you',
                  style: TextStyle(fontSize: 18, fontFamily: CircularBold, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: ScreenUtils.getDesignHeight(30)),
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
              Container(
                padding: EdgeInsets.only(bottom: 50),
                width: double.infinity,
                child: RaisedButton(
                  color: Primary,
                  child: Text("Logout"),
                  onPressed: () {
                    _authBloc.logOut();
                    Navigator.pushNamedAndRemoveUntil(context, LoginRoute, (Route<dynamic> route) => false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
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
                                  fontFamily: Neusa, fontSize: 14, fontWeight: FontWeight.bold, color: Primary),
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
                                  fontFamily: Neusa, fontSize: 14, fontWeight: FontWeight.bold, color: Primary),
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
                          Navigator.pushNamed(context, GamesForSaleRoute);
                        },
                        child: Container(
                          height: ScreenUtils.getDesignHeight(30),
                          width: ScreenUtils.getDesignWidth(80),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.0), color: Primary),
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
