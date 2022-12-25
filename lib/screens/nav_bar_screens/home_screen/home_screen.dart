import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../../../helpers/app_assets.dart';
import '../../../helpers/app_colors.dart';
import '../../../helpers/app_constants.dart';
import '../../../helpers/app_enums.dart';
import '../../../helpers/app_screen_utils.dart';
import '../../../helpers/app_strings.dart';
import '../../../helpers/app_utils.dart';
import '../../../models/common_models/game_list_arguments_model.dart';
import '../../../models/game_details_models/game_details_arguments.dart';
import '../../../models/sales/sales_payload_model.dart';
import '../../../view_models/home_screen/home_screen_model.dart';
import '../../../view_models/view_models.dart';
import '../../../widgets/cached_image_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_game_widget.dart';
import '../../../widgets/custom_text_widget.dart';
import '../../../widgets/gradient_text_widget.dart';
import '../../../widgets/horizontal_scroll_widget.dart';
import '../../../widgets/raised_gradient_button_widget.dart';
import '../../../widgets/slivers/custom_home_sliver.dart';
import '../widgets/section_label_widget.dart';
import 'gamer_buddies_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenModel>().loadAPICalls();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: ScreenUtils.getDesignHeight(330.0),
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: ChangeNotifierProvider.value(
                value: Provider.of<HomeScreenModel>(context),
                child: SliverContent(
                  displayName: context.read<HomeScreenModel>().displayName ?? 'Name',
                ),
              ),
            ),
          ),
          backgroundColor: BACKGROUND_COLOR,
          elevation: 0.0,
        ),
        homeBody()
      ],
    );
  }

  Widget homeBody() => SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionLabel(
                title: "Recommended for you",
                rightText: 'View All',
                onClick: () => Navigator.pushNamed(
                  context,
                  GAME_LIST_SCREEN,
                  arguments: GameListArguments(
                    screenTitle: "Recommended Games",
                    apiType: GameLists.RECOMMENDED,
                    args: {
                      "genre": '',
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtils.getDesignHeight(10.0),
                ),
                child: Consumer<HomeScreenModel>(builder: (_, model, __) {
                  return Container(
                    height: ScreenUtils.getDesignHeight(290),
                    child: Skeleton(
                      isLoading: !model.hasInitialDataLoaded,
                      skeleton: SkeletonGamesListWidget(
                        height: ScreenUtils.getDesignHeight(290),
                        width: ScreenUtils.getDesignWidth(220),
                        count: 10,
                      ),
                      child: HorizontalScrollList(
                        itemCount: model.recommendedGames.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              GAME_DETAILS_SCREEN,
                              arguments: GameDetailsArguments(
                                gameId: model.recommendedGames[index].id,
                              ),
                            ),
                            child: GamesWidget(
                              titleFontSize: 18,
                              backgroundUrl: model.recommendedGames[index].backgroundImage,
                              subTitle: '${model.recommendedGames[index].released}',
                              color: PRIMARY_COLOR,
                              title: model.recommendedGames[index].name,
                              width: ScreenUtils.getDesignWidth(220),
                              height: ScreenUtils.getDesignHeight(290),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
              ),
              SectionLabel(
                title: "Potential Gamer Buddies",
                rightText: "View All",
              ),
              Consumer<HomeScreenModel>(
                builder: (_, val, __) {
                  return Container(
                    margin: EdgeInsets.only(top: 25),
                    height: ScreenUtils.getDesignHeight(205),
                    child: Skeleton(
                      isLoading: !val.hasInitialDataLoaded,
                      skeleton: SkeletonGamesListWidget(
                        count: 10,
                      ),
                      child: HorizontalScrollList(
                        itemCount: val.popularGamesThisYear.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                    context,
                                    GAME_DETAILS_SCREEN,
                                    arguments: GameDetailsArguments(
                                      gameId: val.popularGamesThisYear[index].id,
                                    ),
                                  ),
                              child: GamerBuddyWidget());
                        },
                      ),
                    ),
                  );
                },
              ),
              SectionLabel(
                title: "Popular this Week",
              ),
              Container(
                height: ScreenUtils.getDesignHeight(190),
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedImage(
                          imageUrl:
                              "https://thetomorrowtechnology.co.ke/wp-content/uploads/2020/08/date-sortie-ghost-of-tsushima-ps4-1200x900-1-1.jpg",
                          fit: BoxFit.cover),
                    ),
                    Positioned.fill(
                      bottom: 0,
                      child: Container(
                        width: ScreenUtils.getDesignWidth(220),
                        height: ScreenUtils.getDesignHeight(290),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff091015), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SectionLabel(
                title: "Highly Anticipated",
                rightText: "View All",
              ),
              Consumer<HomeScreenModel>(
                builder: (_, val, __) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    height: ScreenUtils.getDesignHeight(140),
                    child: Skeleton(
                      isLoading: !val.hasInitialDataLoaded,
                      skeleton: SkeletonGamesListWidget(
                        count: 10,
                      ),
                      child: HorizontalScrollList(
                        itemCount: val.upComingGamesThisYear.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              GAME_DETAILS_SCREEN,
                              arguments: GameDetailsArguments(
                                gameId: val.upComingGamesThisYear[index].id,
                              ),
                            ),
                            child: GamesWidget(
                              title: val.upComingGamesThisYear[index].name,
                              subTitle: val.upComingGamesThisYear[index].released != null
                                  ? DateTime.parse(val.upComingGamesThisYear[index].released!)
                                      .format('dd-MM-yyyy')
                                  : "",
                              backgroundUrl: val.upComingGamesThisYear[index].backgroundImage,
                              gradient: PRIMARY_GRADIENT,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );

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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)), gradient: PRIMARY_GRADIENT),
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
                  platforms.firstWhere(
                          (element) => element['id'] == salesPayload.platform)['name'] ??
                      'Not Found',
                  isDynamic: false,
                  style:
                      Theme.of(context).primaryTextTheme.headline4!.copyWith(color: PRIMARY_COLOR),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            height: 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)), color: SUB_TEXT_COLOR),
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
                  decoration: BoxDecoration(
                      gradient: PRIMARY_GRADIENT, borderRadius: BorderRadius.circular(5)),
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
