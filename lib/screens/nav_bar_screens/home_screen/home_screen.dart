import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:play_hq/models/common_models/rawg_platform_model.dart';
import 'package:play_hq/screens/nav_bar_screens/home_screen/trending_week_widget.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../../../helpers/app_assets.dart';
import '../../../helpers/app_colors.dart';
import '../../../helpers/app_constants.dart';
import '../../../helpers/app_enums.dart';
import '../../../helpers/app_fonts.dart';
import '../../../helpers/app_screen_utils.dart';
import '../../../helpers/app_strings.dart';
import '../../../helpers/app_utils.dart';
import '../../../models/common_models/game_list_arguments_model.dart';
import '../../../models/game_details_models/game_details_arguments.dart';
import '../../../models/rawg_models/rawg_game_details.dart';
import '../../../models/sales/sales_payload_model.dart';
import '../../../view_models/home_screen/home_screen_model.dart';
import '../../../view_models/view_models.dart';
import '../../../widgets/bottomSheets/platform_sheet.dart';
import '../../../widgets/cached_image_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_game_widget.dart';
import '../../../widgets/custom_text_widget.dart';
import '../../../widgets/gradient_text_widget.dart';
import '../../../widgets/horizontal_scroll_widget.dart';
import '../../../widgets/raised_gradient_button_widget.dart';
import '../../../widgets/slivers/custom_home_sliver.dart';
import '../widgets/genre_widget.dart';
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
    Provider.of<HomeScreenModel>(context, listen: false).loadAPICalls();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: ScreenUtils.getDesignHeight(280),
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

  // Failure Snackbar
  final SnackBar failureBar = SnackBar(
    content: Text(
      "Add to Watchlist Failed",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.redAccent,
  );

  // Failure Snackbar
  final SnackBar successBar = SnackBar(
    content: Text(
      "Added to Watchlist",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.green,
  );

  Widget homeBody() => SliverToBoxAdapter(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(
            title: "Recommended for you",
            rightText: 'View All',
            onClick: () => Navigator.pushNamed(context, GAME_LIST_SCREEN , arguments: GameListArguments(
              screenTitle: "Recommended Games",
              apiType: GameLists.RECOMMENDED,
              args: {
                "genre": '',
              },
            ),),
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
                        // TODO: Need to create a model for Gamer Buddy Details
                          // TODO: Make a parameter to get the Gamer Buddy in the Widget to populate
                        child: GamerBuddyWidget(
                        )
                      );
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
            child: CarouselSlider.builder(itemCount: 5, itemBuilder: (BuildContext context , int index , int pageViewIndex){
              return TrendingThisWeekWidget();
            }, options: CarouselOptions(
              viewportFraction: 1,
              height: ScreenUtils.getDesignHeight(250),
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 1)
            )),
          ),
          SectionLabel(
            title: "Coming Soon",
            rightText: "View All",
          ),
          Consumer<HomeScreenModel>(
            builder: (_, val, __) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: ScreenUtils.getDesignHeight(180),
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
                        child: _comingSoon(val.upComingGamesThisYear[index])
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

  _showPlatformBottomSheet({VoidCallback? onPressed , required List<RawgPlatformModel> platforms}) async {
    final model = Provider.of<HomeScreenModel>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: ScreenUtils.getDesignHeight(340),
          decoration: BoxDecoration(
            color: POP_UP_CONTAINER_COLOR,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ChangeNotifierProvider.value(
            value: model,
            builder: (BuildContext context, _) {
              return PlatformBottomSheet(
                bottomSheetType: PlatformBottomSheetType.HOME_SCREEN_ADD,
                onPressed: onPressed,
                platformList: platforms,
              );
            },
          ),
        );
      },
    );
  }

  Widget _comingSoon(GameResults results){
    return Container(
      width: ScreenUtils.getDesignWidth(290),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: results.backgroundImage!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  MAIN_CONTAINER_COLOR,
                  Colors.transparent
                ],
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 15 , right: 15 , bottom: 30),
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(results.name ?? '', isDynamic: true, style: TextStyle(fontFamily: Neusa , color: Colors.white , fontSize: 14, fontWeight: FontWeight.w600), maxWidth: ScreenUtils.getDesignWidth(160), minWidth: ScreenUtils.getDesignWidth(50),),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: CustomTextWidget('Available ${results.released}', isDynamic: true, style: TextStyle(fontFamily: CircularBook , color: PRIMARY_COLOR , fontSize: 12, fontWeight: FontWeight.bold), maxWidth: ScreenUtils.getDesignWidth(200), minWidth: ScreenUtils.getDesignWidth(50),)),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      _showPlatformBottomSheet(platforms: results.platforms ?? [] , onPressed: () async {
                        bool value = await Provider.of<HomeScreenModel>(context, listen: false).addToWishlist(results);
                        value ? ScaffoldMessenger.of(context).showSnackBar(successBar) : ScaffoldMessenger.of(context).showSnackBar(failureBar);
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(successBar);
                    },
                    child: Container(
                      width: ScreenUtils.getDesignWidth(100),
                      height: ScreenUtils.getDesignHeight(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                        border: Border.all(color: PRIMARY_COLOR , width: 1.5)
                      ),
                      child: Center(
                        child: Text('Add to Wishlist' , style: TextStyle(color: Colors.white , fontFamily: CircularBook , fontSize: 12),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
