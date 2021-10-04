import 'package:flutter/material.dart';

import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
              // height: ScreenUtils.isStatusBarBig
              //     ? (ScreenUtils.statusBarHeight + ScreenUtils.getDesignHeight(295.0))
              //     : ScreenUtils.getDesignHeight(315.0),
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
          ],
        ),
      ),
    );

    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Stack(
    //       children: [
    //         Positioned.fill(
    //           child: Container(
    //             color: PRIMARY_COLOR,
    //           ),
    //         ),
    //         Positioned.fill(
    //           top: ScreenUtils.getDesignHeight(ScreenUtils.isStatusBarBig ? 315.0 : 270.0),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: BACKGROUND_COLOR,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(15.0),
    //                 topRight: Radius.circular(15.0),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(
    //             top: ScreenUtils.statusBarHeight + 20.0,
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Padding(
    //                 padding: EdgeInsets.symmetric(
    //                   horizontal: ScreenUtils.getDesignWidth(24.0),
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Welcome Damsara,",
    //                           style: Theme.of(context).primaryTextTheme.headline2,
    //                         ),
    //                         SizedBox(
    //                           height: ScreenUtils.getDesignHeight(2.0),
    //                         ),
    //                         Text(
    //                           "Any particular games you’d like to\nbuy today?",
    //                           style: Theme.of(context)
    //                               .primaryTextTheme
    //                               .headline4!
    //                               .copyWith(color: Colors.white.withOpacity(0.60)),
    //                         ),
    //                       ],
    //                     ),
    //                     Stack(
    //                       children: [
    //                         Container(
    //                           decoration: BoxDecoration(
    //                             border: Border.all(
    //                               color: Colors.white,
    //                               width: 1.5,
    //                             ),
    //                             shape: BoxShape.circle,
    //                           ),
    //                           child: CircleAvatar(
    //                             backgroundColor: Colors.amber,
    //                             radius: 24.0,
    //                           ),
    //                         ),
    //                         Positioned(
    //                           bottom: 0.0,
    //                           right: 0.0,
    //                           height: ScreenUtils.getDesignWidth(15.0),
    //                           width: ScreenUtils.getDesignWidth(15.0),
    //                           child: Container(
    //                             decoration: BoxDecoration(
    //                               gradient: GREEN_GRADIENT,
    //                               shape: BoxShape.circle,
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(
    //                   top: ScreenUtils.getDesignHeight(25.0),
    //                   left: ScreenUtils.getDesignWidth(24.0),
    //                   right: ScreenUtils.getDesignWidth(24.0),
    //                 ),
    //                 width: double.infinity,
    //                 height: ScreenUtils.getDesignHeight(50.0),
    //                 decoration: BoxDecoration(
    //                   color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
    //                   borderRadius: BorderRadius.circular(5.0),
    //                 ),
    //                 child: Row(
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsets.only(
    //                         left: ScreenUtils.getDesignWidth(15.0),
    //                       ),
    //                       child: Icon(
    //                         Icons.search_rounded,
    //                         color: Colors.white.withOpacity(0.7),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.only(
    //                         left: ScreenUtils.getDesignWidth(5.0),
    //                       ),
    //                       child: Text(
    //                         "Search Here...",
    //                         style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
    //                               color: Colors.white.withOpacity(0.70),
    //                             ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(
    //                   top: ScreenUtils.getDesignHeight(25.0),
    //                   left: ScreenUtils.getDesignWidth(24.0),
    //                   right: ScreenUtils.getDesignWidth(24.0),
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Container(
    //                       height: ScreenUtils.getDesignWidth(99.0),
    //                       width: ScreenUtils.getDesignWidth(99.0),
    //                       decoration: BoxDecoration(
    //                         color: Colors.amber,
    //                         borderRadius: BorderRadius.circular(5.0),
    //                       ),
    //                     ),
    //                     Container(
    //                       height: ScreenUtils.getDesignWidth(99.0),
    //                       width: ScreenUtils.getDesignWidth(99.0),
    //                       decoration: BoxDecoration(
    //                         color: Colors.amber,
    //                         borderRadius: BorderRadius.circular(5.0),
    //                       ),
    //                     ),
    //                     Container(
    //                       height: ScreenUtils.getDesignWidth(99.0),
    //                       width: ScreenUtils.getDesignWidth(99.0),
    //                       decoration: BoxDecoration(
    //                         color: Colors.amber,
    //                         borderRadius: BorderRadius.circular(5.0),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(
    //                   top: ScreenUtils.getDesignHeight(30.0),
    //                   left: ScreenUtils.getDesignWidth(24.0),
    //                   right: ScreenUtils.getDesignWidth(24.0),
    //                 ),
    //                 child: Text(
    //                   "Top Games",
    //                   style: Theme.of(context).primaryTextTheme.headline4,
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(
    //                   top: ScreenUtils.getDesignHeight(10.0),
    //                 ),
    //                 child: CarouselSlider(
    //                   carouselController: _carouselController,
    //                   options: CarouselOptions(
    //                       initialPage: 0,
    //                       height: ScreenUtils.getDesignHeight(220.0),
    //                       disableCenter: true,
    //                       viewportFraction: 0.85,
    //                       autoPlay: true,
    //                       onPageChanged: (index, _) {
    //                         setState(() {
    //                           _currentIndex = index.toDouble();
    //                         });
    //                       }),
    //                   items: temp.map((e) => _topGamesContainer(hoverImage: e)).toList(),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(
    //                   top: ScreenUtils.getDesignHeight(10.0),
    //                 ),
    //                 child: DottedIndicatorWidget(
    //                   currentPage: _currentIndex.toInt(),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(
    //                   top: ScreenUtils.getDesignHeight(30.0),
    //                   left: ScreenUtils.getDesignWidth(24.0),
    //                   right: ScreenUtils.getDesignWidth(24.0),
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       "From your Wishlist",
    //                       style: Theme.of(context).primaryTextTheme.headline4,
    //                     ),
    //                     GradientText(
    //                       "View All",
    //                       gradient: PRIMARY_GRADIENT,
    //                       style: Theme.of(context).primaryTextTheme.headline4,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
}
