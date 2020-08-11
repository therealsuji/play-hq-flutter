import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/carousal_widget.dart';

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
              padding: const EdgeInsets.only(top: 60),
              child: CarouselSlider(
                options: CarouselOptions(
                    height: ScreenUtils.getDesignHeight(180),
                    disableCenter: true,
                    viewportFraction: 0.83,
                    enlargeCenterPage: true,

                    enlargeStrategy: CenterPageEnlargeStrategy.scale),
                items: [1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Stack(
                             overflow: Overflow.visible,
                            children: [
                              Container(
                                height: ScreenUtils.getDesignHeight(180),
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/cyber.png',
                                    ),
                                  ),
                                ),

                              ),
                              Container(
                                height: ScreenUtils.getDesignHeight(180),
                                 decoration: BoxDecoration(
                                     borderRadius:BorderRadius.circular(5),

                                     color: Colors.white,
                                    gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                          Colors.white.withOpacity(0.0),
                                          Colors.black.withOpacity(0.9),
                                        ],
                                        stops: [
                                          0.0,
                                          1.0
                                        ])),
                              ),
                              Positioned(
                                right:0,
                                bottom:50,

                                child:Container(color: Colors.red,height: ScreenUtils.getDesignHeight(200),width: 100,),
                              ),
                            ],
                          ));
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
