import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_assets.dart';

import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/dotted_indicator_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:play_hq/widgets/rasied_gradient_button_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController _carouselController = CarouselController();

  double _currentIndex = 0.0;

  @override
  Widget build(BuildContext context) {
    List<String> temp = ["assets/images/stack_temp.png", "assets/images/cyber-ct.png", "assets/images/cyber-ct.png"];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(gradient: PRIMARY_GRADIENT),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    bottom: -0.2,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: ScreenUtils.getDesignHeight(47.0),
                        decoration: BoxDecoration(
                          color: BACKGROUND_COLOR,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtils.statusBarHeight + 20,
                      left: ScreenUtils.getDesignWidth(24.0),
                      right: ScreenUtils.getDesignWidth(24.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Damsara,",
                                  style: Theme.of(context).primaryTextTheme.headline2,
                                ),
                                SizedBox(
                                  height: ScreenUtils.getDesignHeight(2.0),
                                ),
                                Text(
                                  "Any particular games you’d like to\nbuy today?",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4!
                                      .copyWith(color: Colors.white.withOpacity(0.60)),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    radius: 24.0,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  height: ScreenUtils.getDesignWidth(15.0),
                                  width: ScreenUtils.getDesignWidth(15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: GREEN_GRADIENT,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: ScreenUtils.getDesignHeight(25.0),
                          ),
                          width: double.infinity,
                          height: ScreenUtils.getDesignHeight(50.0),
                          decoration: BoxDecoration(
                            color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: ScreenUtils.getDesignWidth(15.0),
                                ),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: ScreenUtils.getDesignWidth(5.0),
                                ),
                                child: Text(
                                  "Search Here...",
                                  style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                                        color: Colors.white.withOpacity(0.70),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtils.getDesignWidth(24.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: ScreenUtils.getDesignWidth(99.0),
                                width: ScreenUtils.getDesignWidth(99.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              Container(
                                height: ScreenUtils.getDesignWidth(99.0),
                                width: ScreenUtils.getDesignWidth(99.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              Container(
                                height: ScreenUtils.getDesignWidth(99.0),
                                width: ScreenUtils.getDesignWidth(99.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(20.0),
                left: ScreenUtils.getDesignWidth(24.0),
                right: ScreenUtils.getDesignWidth(24.0),
              ),
              child: Text(
                "Top Games",
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(10.0),
              ),
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                    initialPage: 0,
                    height: ScreenUtils.getDesignHeight(220.0),
                    disableCenter: true,
                    viewportFraction: 0.85,
                    autoPlay: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index.toDouble();
                      });
                    }),
                items: temp.map((e) => _topGamesContainer(hoverImage: e)).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(10.0),
              ),
              child: DottedIndicatorWidget(
                currentPage: _currentIndex.toInt(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(30.0),
                left: ScreenUtils.getDesignWidth(24.0),
                right: ScreenUtils.getDesignWidth(24.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From your Wishlist",
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                  GradientText(
                    "View All",
                    gradient: PRIMARY_GRADIENT,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                ],
              ),
            ),
            _learnMoreContainer(),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(30.0),
                left: ScreenUtils.getDesignWidth(24.0),
                right: ScreenUtils.getDesignWidth(24.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Game Bundles",
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                  GradientText(
                    "View All",
                    gradient: PRIMARY_GRADIENT,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                ],
              ),
            ),
            _gameBundlesContainer(),
          ],
        ),
      ),
    );
  }

  Widget _topGamesContainer({required String hoverImage}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtils.getDesignWidth(5.0),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            height: ScreenUtils.getDesignHeight(201.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cyberpunk2077.jpg'),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            height: ScreenUtils.getDesignHeight(201.0),
            child: Container(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(44.0),
                left: ScreenUtils.getDesignWidth(15.0),
              ),
              decoration: BoxDecoration(
                color: MAIN_CONTAINER_COLOR.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ScreenUtils.getDesignWidth(150.0),
                    child: Text(
                      "Call of Duty: Modern Warfare",
                      style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                  Text(
                    "12/09/2019",
                    style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                          color: SUB_TEXT_COLOR.withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            height: ScreenUtils.getDesignHeight(201.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(hoverImage),
                  alignment: Alignment.centerRight,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            height: ScreenUtils.getDesignHeight(65.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtils.getDesignWidth(15.0),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        "5600 LKR",
                        gradient: GREEN_GRADIENT,
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ),
                      Text(
                        "Colombo 06",
                        style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                              color: SUB_TEXT_COLOR.withOpacity(0.6),
                            ),
                      ),
                    ],
                  ),
                  Container(
                    height: ScreenUtils.getDesignWidth(33.0),
                    width: ScreenUtils.getDesignWidth(91.0),
                    child: RaisedGradientButton(
                      buttonText: "Buy Now",
                      gradient: PRIMARY_GRADIENT,
                      textFontSize: 14.0,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _learnMoreContainer() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtils.getDesignHeight(25.0),
        left: ScreenUtils.getDesignWidth(24.0),
        right: ScreenUtils.getDesignWidth(24.0),
      ),
      height: ScreenUtils.getDesignHeight(162.0),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            LEARN_MORE,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: ScreenUtils.getDesignWidth(22.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Let’s go PRO",
              style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                fontSize: 25,
                shadows: [
                  Shadow(
                    offset: Offset(0.0, 3.0),
                    blurRadius: 6.0,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            Text(
              "Stay upto date with all the best\ngoodies offered by PlayHQ",
              style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                fontSize: 10,
                shadows: [
                  Shadow(
                    offset: Offset(0.0, 3.0),
                    blurRadius: 6.0,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            CustomButton(
              height: ScreenUtils.getDesignHeight(28.0),
              width: ScreenUtils.getDesignWidth(77.0),
              buttonText: "Learn More",
              gradient: PRIMARY_GRADIENT,
              textFontSize: 8.0,
              onPressed: () {}
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBundlesContainer() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtils.getDesignHeight(15.0),
        horizontal: ScreenUtils.getDesignWidth(24.0),
      ),
      height: ScreenUtils.getDesignHeight(222.0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtils.getDesignHeight(15.0),
              left: ScreenUtils.getDesignWidth(12.0),
              right: ScreenUtils.getDesignWidth(12.0),
            ),
            height: ScreenUtils.getDesignHeight(198.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: MAIN_CONTAINER_COLOR,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtils.getDesignWidth(92.0),
                  height: ScreenUtils.getDesignHeight(127.0),
                  color: Colors.amber,
                ),
                Container(
                  width: ScreenUtils.getDesignWidth(92.0),
                  height: ScreenUtils.getDesignHeight(127.0),
                  color: Colors.amber,
                ),
                Container(
                  width: ScreenUtils.getDesignWidth(92.0),
                  height: ScreenUtils.getDesignHeight(127.0),
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          Positioned(
            left: ScreenUtils.getDesignWidth(12.0),
            right: ScreenUtils.getDesignWidth(12.0),
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtils.getDesignWidth(10.0),
              ),
              height: ScreenUtils.getDesignHeight(65.0),
              decoration: BoxDecoration(
                color: MAIN_CONTAINER_COLOR,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: SUB_TEXT_COLOR.withOpacity(0.6),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bundle Price",
                        style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                          fontSize: 10.0,
                        ),
                      ),
                      GradientText(
                        "5200.00 LKR",
                        gradient: GREEN_GRADIENT,
                        style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: ScreenUtils.getDesignWidth(24.0),
                        ),
                        color: SUB_TEXT_COLOR.withOpacity(0.4),
                        height: ScreenUtils.getDesignHeight(41.0),
                        width: ScreenUtils.getDesignWidth(1.0),
                      ),
                      CustomButton(
                        height: ScreenUtils.getDesignHeight(33.0),
                        width: ScreenUtils.getDesignWidth(94.0),
                        buttonText: "View Deal",
                        gradient: PRIMARY_GRADIENT,
                        textFontSize: 10.0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}