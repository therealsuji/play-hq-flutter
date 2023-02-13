import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_constants.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_fonts.dart';
import '../../../helpers/app_screen_utils.dart';

class CarouselItemWidget extends StatelessWidget {

  final String imagePath;
  final String title;

  CarouselItemWidget({required this.imagePath , required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(330),
      child: Stack(
        children: [
          Container(
            height: ScreenUtils.getDesignHeight(310),
            child: CachedNetworkImage(imageUrl: imagePath,fit: BoxFit.cover,
            )
          ),
          Container(
            height: ScreenUtils.getDesignHeight(330),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  BACKGROUND_COLOR,
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Container(
            height: ScreenUtils.getDesignHeight(330),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  BACKGROUND_COLOR,
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(
                  left: ScreenUtils.getDesignWidth(24), bottom: ScreenUtils.getDesignHeight(60)),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: Neusa,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {

  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(itemCount: testingCarousalData.length, itemBuilder: (BuildContext ctx, int index , int pageViewIndex) {
      return CarouselItemWidget(imagePath: testingCarousalData[index]['image'],title: testingCarousalData[index]['title'],);
    }, options: CarouselOptions(
        viewportFraction: 1,
        height: ScreenUtils.getDesignHeight(330),
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1)
    ));
  }
}

