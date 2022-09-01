import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/screens/nav_bar_screens/widgets/genre_widget.dart';
import 'package:play_hq/screens/nav_bar_screens/widgets/section_label_widget.dart';
import 'package:play_hq/widgets/active_game_sales_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/horizontal_scroll_widget.dart';
import 'package:provider/provider.dart';

import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/home_screen/home_screen_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/dotted_indicator_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:play_hq/widgets/raised_gradient_button_widget.dart';

import '../../widgets/custom_game_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> temp = [
    {
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BZWYxY2VmN2ItNjNlNi00ZmM0LWEwMjEtMTE1NGQxMGVhMWQxXkEyXkFqcGdeQXVyMTk2OTAzNTI@._V1_FMjpg_UX1000_.jpg",
      "name": "Call of Duty Warzone",
    },
    {
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BZWYxY2VmN2ItNjNlNi00ZmM0LWEwMjEtMTE1NGQxMGVhMWQxXkEyXkFqcGdeQXVyMTk2OTAzNTI@._V1_FMjpg_UX1000_.jpg",
      "name": "Call of Duty Warzone",
    },
    {
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BZWYxY2VmN2ItNjNlNi00ZmM0LWEwMjEtMTE1NGQxMGVhMWQxXkEyXkFqcGdeQXVyMTk2OTAzNTI@._V1_FMjpg_UX1000_.jpg",
      "name": "Call of Duty Warzone",
    },
    {
      "imageUrl":
          "https://m.media-amazon.com/images/M/MV5BZWYxY2VmN2ItNjNlNi00ZmM0LWEwMjEtMTE1NGQxMGVhMWQxXkEyXkFqcGdeQXVyMTk2OTAzNTI@._V1_FMjpg_UX1000_.jpg",
      "name": "Call of Duty Warzone",
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<HomeScreenModel>(context, listen: false).loadAPICalls();
  }

  @override
  Widget build(BuildContext context) {
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
                                Consumer<HomeScreenModel>(builder: (_, model, __) {
                                  return Text(
                                    "Welcome ${model.displayName ?? 'to PlayHQ'}",
                                    style: Theme.of(context).primaryTextTheme.headline2,
                                  );
                                }),
                                SizedBox(
                                  height: ScreenUtils.getDesignHeight(2.0),
                                ),
                                Text(
                                  "Any particular games you’d like to\nbuy today?",
                                  style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                                        color: Colors.white.withOpacity(0.60),
                                      ),
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
                        GestureDetector(
                          onTap: () =>
                              locator<NavigationService>().pushNamed(MAIN_SEARCH_SCREEN, args: SearchType.MAIN_SEARCH),
                          child: Container(
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtils.getDesignWidth(24.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: GenreWidget(
                                  gradient: GENRE_YELLOW_GRADIENT,
                                  name: "ACTION",
                                  imageUrl: ACTION_GENRE_IMAGE,
                                ),
                                onTap: () => locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN),
                              ),
                              InkWell(
                                child: GenreWidget(
                                  gradient: GENRE_BLUE_GRADIENT,
                                  name: "ADVENTURE",
                                  imageUrl: ADVENTURE_GENRE_IMAGE,
                                ),
                                onTap: () => locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN),
                              ),
                              InkWell(
                                child: GenreWidget(
                                  gradient: GENRE_GREEN_GRADIENT,
                                  name: "RACING",
                                  imageUrl: RACING_GENRE_IMAGE,
                                ),
                                onTap: () => locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN),
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
            SectionLabel(
              title: "Recommended for you",
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(10.0),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  initialPage: 0,
                  height: ScreenUtils.getDesignHeight(220.0),
                  disableCenter: true,
                  viewportFraction: 0.85,
                  autoPlay: true,
                  onPageChanged: (index, _) =>
                      Provider.of<HomeScreenModel>(context, listen: false).onCarouselPageChanged(index),
                ),
                items: temp.map((e) => _topGamesContainer(hoverImage: e['imageUrl'] ?? "")).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(10.0),
              ),
              child: Consumer<HomeScreenModel>(
                builder: (_, model, __) {
                  return DottedIndicatorWidget(
                    currentPage: model.carouselPageIndex,
                  );
                },
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
                    "Best Solo Deals",
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
            Consumer<HomeScreenModel>(
              builder: (_, val, __) {
                return Container(
                  margin: EdgeInsets.only(top: 15),
                  height: ScreenUtils.getDesignHeight(140),
                  child: HorizontalScrollList(
                    itemCount: val.soloGames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return val.soloGames.length != 0
                          ? GestureDetector(
                              onTap: () => locator<NavigationService>()
                                  .pushNamed(GAME_SALE_DETAILS_SCREEN, args: val.soloGames[index]),
                              child: GamesWidget(
                                title: val.soloGames[index].gameList?[0].game.title,
                                subTitle: val.soloGames[index].price?.toString() ?? "",
                                backgroundUrl: val.soloGames[index].gameList?[0].game.boxCover,
                                gradient: GREEN_GRADIENT,
                              ),
                            )
                          : Center(
                              child: Text(
                                'No games available yet',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                    },
                  ),
                );
              },
            ),
            _learnMoreContainer(),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(30.0),
                left: ScreenUtils.getDesignWidth(24.0),
                right: ScreenUtils.getDesignWidth(24.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sales in Wishlist",
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
            Consumer<HomeScreenModel>(
              builder: (_, val, __) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: ScreenUtils.getDesignHeight(205),
                  child: HorizontalScrollList(
                    itemBuilder: (BuildContext context, int index) {
                      return val.wishListGames.length != 0
                          ? GestureDetector(
                              onTap: () => locator<NavigationService>()
                                  .pushNamed(GAME_SALE_DETAILS_SCREEN, args: val.wishListGames[index]),
                              child: ActiveGameSalesWidget(salesPayload: val.wishListGames[index]))
                          : Center(
                              child: Text(
                                'No games available yet',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                    },
                    itemCount: val.wishListGames.length,
                  ),
                );
              },
            ),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBundlesContainer(SalesPayload salesPayload) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtils.getDesignHeight(15.0),
      ),
      width: ScreenUtils.getDesignWidth(327),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(15.0),
                left: ScreenUtils.getDesignWidth(12.0),
                right: ScreenUtils.getDesignWidth(12.0),
              ),
              decoration: BoxDecoration(
                color: MAIN_CONTAINER_COLOR,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: salesPayload.gameList!.map((e) {
                    return GamesWidget(
                      height: 130,
                      width: 90,
                      title: e.game.title ?? "",
                      subTitle: e.status,
                      backgroundUrl: e.game.boxCover,
                      gradient: PRIMARY_GRADIENT,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 30),
            height: 1.5,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.0)), gradient: PRIMARY_GRADIENT),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CustomTextWidget(
                  "Platform",
                  isDynamic: false,
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                Spacer(),
                CustomTextWidget(
                  platforms.firstWhere((element) => element['id'] == salesPayload.platform)['name'] ?? 'Not Found',
                  isDynamic: false,
                  style: Theme.of(context).primaryTextTheme.headline4!.copyWith(color: PRIMARY_COLOR),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            height: 1.5,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.0)), color: SUB_TEXT_COLOR),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CustomTextWidget(
                  "Price",
                  isDynamic: false,
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                Spacer(),
                GradientText(
                  salesPayload.price.toString(),
                  gradient: GREEN_GRADIENT,
                  style: Theme.of(context).primaryTextTheme.headline4,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Row(
              children: [
                Spacer(),
                Container(
                  height: ScreenUtils.getDesignHeight(40),
                  width: ScreenUtils.getDesignWidth(100),
                  decoration: BoxDecoration(gradient: PRIMARY_GRADIENT, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    'More Details',
                    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
