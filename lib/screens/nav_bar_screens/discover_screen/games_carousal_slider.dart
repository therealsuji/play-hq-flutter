import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_fonts.dart';
import '../../../helpers/app_screen_utils.dart';

class CarouselItemWidget extends StatelessWidget {

  final String imagePath;
  final String title;
  final String genres;

  CarouselItemWidget({required this.imagePath , required this.title , required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(500),
      child: Stack(
        children: [
          Container(
            height: ScreenUtils.getDesignHeight(600),
            child: CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.fitHeight,
            )
          ),
          Container(
            height: ScreenUtils.getDesignHeight(800),
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
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                  left: ScreenUtils.getDesignWidth(24)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: Neusa,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      genres,
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 18,
                          fontFamily: CircularBook,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: CustomButton(buttonText: 'Add to Wishlist', gradient: PRIMARY_GRADIENT, height: ScreenUtils.getDesignHeight(40), width: ScreenUtils.getDesignWidth(140),),
                  )
                ],
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
      return CarouselItemWidget(imagePath: testingCarousalData[index]['image'],title: testingCarousalData[index]['title'], genres: testingCarousalData[index]['genres'],);
    }, options: CarouselOptions(
        viewportFraction: 1,
        height: ScreenUtils.getDesignHeight(330),
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1)
    ));
  }
}

