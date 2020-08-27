import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/carousal_widget.dart';
import 'package:play_hq/widgets/discover_carousel_widget.dart';
import 'package:play_hq/widgets/game_widget.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Background,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 25),
        // DO THE BOUNCY THANGG
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 51),
              child: Row(
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: CircularBold),
                  ),
                  Spacer(),
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Stack(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
              child: Text(
                "Find your awesome games",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontFamily: CircularBold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CarouselSlider(
                options: CarouselOptions(
                    height: ScreenUtils.getDesignHeight(220),
                    disableCenter: true,
                    viewportFraction: 0.85,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale),
                items: [1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return DiscoverCarouselWidget(
                        gameName: "Cyberpunk 2077",
                        backgroundUrl: 'assets/images/cyber.png',
                        characterUrl: 'assets/images/cyber-ct.png',
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: ScreenUtils.getDesignHeight(70),
              child: ListView.builder(
                  // BOUNCYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
//                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return customCategoryButton();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 25),
              child: Text('Top Games',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: CircularBold)),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: ScreenUtils.getDesignHeight(160),
              child: ListView.builder(
                  // BOUNCYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
//                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: (){Navigator.pushNamed(context, GameDetailRoute);},
                        child: GamesWidget(
                          gameName: 'Ghost of Tsushima',
                          price: '4000 LKR',
                          backgroundUrl: 'assets/images/tshushima.jpg',
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 25),
              child: Text('New Releases',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: CircularBold)),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: ScreenUtils.getDesignHeight(160),
              child: ListView.builder(
                  // BOUNCYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
//                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: GamesWidget(
                        gameName: 'Ghost of Tsushima',
                        price: '4000 LKR',
                        backgroundUrl: 'assets/images/tshushima.jpg',
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customCategoryButton() {
  return Container(
    margin: EdgeInsets.only(right: 15),
    width: ScreenUtils.getDesignWidth(135),
    child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
            image: ExactAssetImage('assets/images/platform.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Text('Platforms',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
                fontFamily: CircularBold)),
      ),
    ),
  );
}
