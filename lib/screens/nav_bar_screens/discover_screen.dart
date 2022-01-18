import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_game_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';

class DiscoverScreen extends StatelessWidget {
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
            Container(
              height: ScreenUtils.getDesignHeight(165),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: testerGames.length,
                  itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtils.getDesignHeight(20.0),
                    left: index == 0 ? ScreenUtils.getDesignWidth(24.0)
                        : ScreenUtils.getDesignWidth(15.0),
                    right: index == testerGames.length ? ScreenUtils.getDesignWidth(24.0) : ScreenUtils.getDesignWidth(0)
                  ),
                  child: GamesWidget(
                    gameName: testerGames[index]['name'],
                    releaseDate: testerGames[index]['releaseDate'],
                    backgroundUrl: testerGames[index]['coverImage'],
                    gradient: PRIMARY_GRADIENT,
                  ),
                );
              }),
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
            _gameofTheWeekWidget()
          ]),
        ));
  }

  Widget _gameofTheWeekWidget(){
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtils.getDesignHeight(15.0),
        left: ScreenUtils.getDesignWidth(24.0),
        right: ScreenUtils.getDesignWidth(24.0),
      ),
      height: ScreenUtils.getDesignWidth(180),
      color: Colors.white,
    );
  }

  Widget _categoryWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: ScreenUtils.getDesignHeight(205),
        margin: EdgeInsets.only(
            left: ScreenUtils.getDesignWidth(24)),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return _categoryItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: ScreenUtils.getDesignWidth(15),
            );
          },
        ),
      ),
    );
  }

  Widget _categoryItem(){
    return Container(
      height: ScreenUtils.getDesignHeight(180),
      width: ScreenUtils.getDesignWidth(155),
      color: Colors.red,
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
