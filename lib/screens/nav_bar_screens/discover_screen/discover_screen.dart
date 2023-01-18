import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/screens/nav_bar_screens/widgets/section_label_widget.dart';
import 'package:provider/provider.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_constants.dart';
import '../../../helpers/app_enums.dart';
import '../../../helpers/app_fonts.dart';
import '../../../helpers/app_screen_utils.dart';
import '../../../helpers/app_strings.dart';
import '../../../models/common_models/game_list_arguments_model.dart';
import '../../../models/game_details_models/game_details_arguments.dart';
import '../../../view_models/discover/discover_view_model.dart';
import '../../../widgets/custom_game_widget.dart';
import '../../../widgets/custom_text_widget.dart';
import '../../../widgets/gradient_text_widget.dart';
import '../../../widgets/horizontal_scroll_widget.dart';
import '../home_screen/trending_week_widget.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    Provider.of<DiscoverViewModel>(context, listen: false).performAPIs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: ScreenUtils.getDesignHeight(495),
              child: Stack(
                children: [
                  _carousalWidget(),
                  _categoryWidget(),
                ],
              ),
            ),
            SectionLabel(title: 'Most Wishlisted Games' , rightText: 'View All',),
            Container(
              child: CarouselSlider.builder(itemCount: 5, itemBuilder: (BuildContext context , int index , int pageViewIndex){
                return TrendingThisWeekWidget();
              }, options: CarouselOptions(
                  viewportFraction: 0.85,
                  enlargeCenterPage: true,
                  height: ScreenUtils.getDesignHeight(250),
                  autoPlay: true,

                  autoPlayAnimationDuration: Duration(seconds: 1)
              )),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(30.0),
                left: ScreenUtils.getDesignWidth(24.0),
                right: ScreenUtils.getDesignWidth(24.0),
              ),
              child: CustomTextWidget(
                'Play HQ Game of the Week',
                isDynamic: false,
                width: ScreenUtils.getDesignWidth(165),
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
            ),
            _gameofTheWeekWidget(),
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
                    'First Person Shooter',
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  GradientText(
                    "View All",
                    gradient: PRIMARY_GRADIENT,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                ],
              ),
            ),
            Consumer<DiscoverViewModel>(builder: (_, val, __) {
              return Container(
                margin: EdgeInsets.only(top: 10, bottom: ScreenUtils.getDesignHeight(30.0)),
                height: ScreenUtils.getDesignHeight(155),
                child: HorizontalScrollList(
                  itemCount: val.fpsGames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        GAME_DETAILS_SCREEN,
                        arguments: GameDetailsArguments(
                          gameId: val.fpsGames[index].id,
                        ),
                      ),
                      child: GamesWidget(
                        title: val.fpsGames[index].name,
                        subTitle: val.fpsGames[index].released,
                        backgroundUrl: val.fpsGames[index].backgroundImage,
                        gradient: PRIMARY_GRADIENT,
                      ),
                    );
                  },
                ),
              );
            }),
          ]),
        ));
  }

  Widget _mostWishlistedGames() {
    return Container();
  }

  Widget _gameofTheWeekWidget() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtils.getDesignHeight(15.0),
        left: ScreenUtils.getDesignWidth(24.0),
        right: ScreenUtils.getDesignWidth(24.0),
      ),
      height: ScreenUtils.getDesignWidth(180),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenUtils.getDesignWidth(10.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: ScreenUtils.getDesignWidth(10.0),
            offset: Offset(0, ScreenUtils.getDesignWidth(10.0)),
          ),
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: ScreenUtils.getDesignHeight(205),
        child: HorizontalScrollList(
          itemCount: discoverComponents.length,
          itemBuilder: (context, index) => _categoryItem(
            discoverComponents[index]['name'],
            discoverComponents[index]['gradient'],
            discoverComponents[index]['imagePath'],
            discoverComponents[index]['category'],
            discoverComponents[index]['apiType'],
          ),
        ),
      ),
    );
  }

  Widget _categoryItem(String categoryName, LinearGradient gradient, String imagePath,
      DiscoverCategory category, GameLists apiType) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        GAME_LIST_SCREEN,
        arguments: GameListArguments(
          screenTitle: categoryName,
          apiType: apiType,
        ),
      ),
      child: Container(
        height: ScreenUtils.getDesignHeight(180),
        width: ScreenUtils.getDesignWidth(156),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtils.getDesignWidth(5)), gradient: gradient),
        child: Container(
          margin: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(30),
            bottom: ScreenUtils.getDesignHeight(0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                categoryName,
                style: Theme.of(context).primaryTextTheme.headline3,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              // Image.asset(imagePath ,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _carousalWidget() {
    return Container(
      height: ScreenUtils.getDesignHeight(330),
      child: Stack(
        children: [
          Container(
            height: ScreenUtils.getDesignHeight(310),
            child: Image.network(
              'https://staticctf.akamaized.net/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/4n6MuqhtRggMjHkAiZJwQY/c77f0a13308353942e2e134b95801c6f/ac-valhalla-heroBanner.jpg',
              fit: BoxFit.cover,
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
                'Assasin\'s Creed \nValhalla',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: Neusa,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
