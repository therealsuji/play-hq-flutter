import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/carousal_widget.dart';
import 'package:play_hq/widgets/discover_carousel_widget.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController carouselController =
        PageController(initialPage: 0, viewportFraction: 0.9);
    return Scaffold(
      backgroundColor: Background,
      body: SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}
