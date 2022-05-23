import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/game_details_models/game_details_arguments.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/discover/discover_view_model.dart';
import 'package:play_hq/widgets/custom_game_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_enums.dart';
import '../../service_locator.dart';

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
                    'Latest Releases',
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
                height: ScreenUtils.getDesignHeight(155),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: val.newlyReleasedGames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtils.getDesignHeight(15.0),
                            left: index == 0
                                ? ScreenUtils.getDesignWidth(24.0)
                                : ScreenUtils.getDesignWidth(15.0),
                            right: index == val.newlyReleasedGames.length
                                ? ScreenUtils.getDesignWidth(24.0)
                                : ScreenUtils.getDesignWidth(0)),
                        child: GestureDetector(
                          onTap: () => locator<NavigationService>().pushNamed(
                              GAME_DETAILS_SCREEN,
                              args: GameDetailsArguments(
                                  gameId: val.newlyReleasedGames[index].id)),
                          child: GamesWidget(
                            gameName: val.newlyReleasedGames[index].name,
                            releaseDate: val.newlyReleasedGames[index].released,
                            backgroundUrl:
                                val.newlyReleasedGames[index].backgroundImage,
                            gradient: PRIMARY_GRADIENT,
                          ),
                        ),
                      );
                    }),
              );
            }),
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
                margin:
                    EdgeInsets.only(bottom: ScreenUtils.getDesignHeight(30.0)),
                height: ScreenUtils.getDesignHeight(155),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: val.fpsGames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtils.getDesignHeight(15.0),
                            left: index == 0
                                ? ScreenUtils.getDesignWidth(24.0)
                                : ScreenUtils.getDesignWidth(15.0),
                            right: index == val.fpsGames.length
                                ? ScreenUtils.getDesignWidth(24.0)
                                : ScreenUtils.getDesignWidth(0)),
                        child: GestureDetector(
                          onTap: () => locator<NavigationService>().pushNamed(
                              GAME_DETAILS_SCREEN,
                              args: GameDetailsArguments(
                                  gameId: val.fpsGames[index].id)),
                          child: GamesWidget(
                            gameName: val.fpsGames[index].name,
                            releaseDate: val.fpsGames[index].released,
                            backgroundUrl: val.fpsGames[index].backgroundImage,
                            gradient: PRIMARY_GRADIENT,
                          ),
                        ),
                      );
                    }),
              );
            }),
          ]),
        ));
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
        margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(24)),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return _categoryItem(
                discoverComponents[index]['name'],
                discoverComponents[index]['gradient'],
                discoverComponents[index]['imagePath'],
                discoverComponents[index]['category']
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: ScreenUtils.getDesignWidth(15.0),
                right: index == 3 ? ScreenUtils.getDesignWidth(15.0) : 0,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _categoryItem(
      String categoryName, LinearGradient gradient, String imagePath , DiscoverCategory category) {
    return GestureDetector(
      onTap: () => locator<NavigationService>().pushNamed(GAME_LIST_SCREEN),
      child: Container(
        height: ScreenUtils.getDesignHeight(180),
        width: ScreenUtils.getDesignWidth(156),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtils.getDesignWidth(5)),
            gradient: gradient),
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
                  left: ScreenUtils.getDesignWidth(24),
                  bottom: ScreenUtils.getDesignHeight(60)),
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
