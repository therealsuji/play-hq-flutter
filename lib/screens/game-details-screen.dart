import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:play_hq/helpers/app-assets.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/game_details/game_details_model.dart';
import 'package:play_hq/widgets/custom-body.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/custom-game-widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:provider/provider.dart';

class GameDetailsScreen extends StatefulWidget {
  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: Create Similar Games, OnTap for Company Tile and Genre Image
    Provider.of<GameDetailsModel>(context, listen: false).getGameDetails(134);
  }

  List<String> temp = ["1", "2", "3", "4", "5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        paddingLeft: 0.0,
        paddingTop: 0.0,
        paddingRight: 0.0,
        getStatusBar: false,
        body: [
          Stack(
            children: [
              Consumer<GameDetailsModel>(
                builder: (_, model, __) {
                  return CachedNetworkImage(
                    height: ScreenUtils.getDesignHeight(293.0),
                    width: double.infinity,
                    placeholder: (context, url) => Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: PRIMARY_COLOR,
                        ),
                      ),
                    ),
                    imageUrl: model.gameDetails.backgroundImage ?? "https://i.stack.imgur.com/y9DpT.jpg",
                    fit: BoxFit.cover,
                  );
                },
              ),
              Container(
                height: ScreenUtils.getDesignHeight(293.0),
                width: double.infinity,
                color: Color(0xFF08090A).withOpacity(0.7),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtils.getDesignHeight(ScreenUtils.isStatusBarBig ? 80.0 : 42.0),
                      left: ScreenUtils.getDesignWidth(24.0),
                      right: ScreenUtils.getDesignWidth(24.0),
                    ),
                    // TODO: ADD BELL SVG
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset(
                            BACK_ARROW_ICON,
                            height: ScreenUtils.getDesignHeight(27.0),
                          ),
                          onTap: () {
                            Provider.of<GameDetailsModel>(context, listen: false).navigateMainScreen();
                          },
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(
                            BACK_ARROW_ICON,
                            height: ScreenUtils.getDesignHeight(27.0),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Consumer<GameDetailsModel>(
                    builder: (_, model, __) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtils.getDesignWidth(24.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headerTileContainer(
                              title: model.gameDetails.nameOriginal,
                              releaseDate: model.gameDetails.released,
                              rate: model.gameDetails.rating,
                            ),
                            GridView.builder(
                              padding: EdgeInsets.only(
                                top: ScreenUtils.getDesignHeight(15.0),
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                                mainAxisExtent: ScreenUtils.getDesignHeight(35.0),
                              ),
                              itemCount: model.gameDetails.platforms?.length ?? 0,
                              itemBuilder: (context, index) {
                                return _platformContainer(model.gameDetails.platforms?[index].name ?? "");
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtils.getDesignHeight(25.0),
                      right: ScreenUtils.getDesignWidth(24.0),
                      left: ScreenUtils.getDesignWidth(24.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonText: "Add to Wishlist",
                            gradient: SECONDARY_GRADIENT,
                            height: ScreenUtils.getDesignHeight(35.0),
                            textFontSize: 10.0,
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtils.getDesignWidth(15.0),
                        ),
                        Expanded(
                          child: CustomButton(
                            buttonText: "Add to Library",
                            gradient: PRIMARY_GRADIENT,
                            height: ScreenUtils.getDesignHeight(35.0),
                            textFontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _companyContainer(),
                  _subHeadingContainer(title: "Genre", paddingTop: 30.0),
                  Consumer<GameDetailsModel>(
                    builder: (_, model, __) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtils.getDesignHeight(15.0),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: model.gameDetails.genres != null
                                ? model.gameDetails.genres!.map((g) {
                                    return _genreListContainer(
                                      name: g.name,
                                      index: model.gameDetails.genres!.indexOf(g),
                                    );
                                  }).toList()
                                : [],
                          ),
                        ),
                      );
                    },
                  ),
                  _subHeadingContainer(title: "Game Screenshots"),
                  Consumer<GameDetailsModel>(
                    builder: (_, model, __) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtils.getDesignHeight(15.0),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: model.gameScreenshots.results != null
                                ? model.gameScreenshots.results!.map((s) {
                                    return _genreScreenshotContainer(
                                      imagePath: s.image,
                                      index: model.gameScreenshots.results!.indexOf(s),
                                    );
                                  }).toList()
                                : [],
                          ),
                        ),
                      );
                    },
                  ),
                  _subHeadingContainer(title: "Description"),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtils.getDesignHeight(15.0),
                      left: ScreenUtils.getDesignWidth(24.0),
                      right: ScreenUtils.getDesignWidth(24.0),
                    ),
                    child: Consumer<GameDetailsModel>(
                      builder: (_, model, __) {
                        return Text(
                          model.gameDetails.description ?? "",
                          style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                                color: SUB_TEXT_COLOR,
                                fontSize: 12.0,
                              ),
                        );
                      },
                    ),
                  ),
                  _subHeadingContainer(title: "Similar Games"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: temp.map((e) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtils.getDesignHeight(15.0),
                            left: ScreenUtils.getDesignWidth(
                              temp.indexOf(e) == 0 ? 24.0 : 15.0,
                            ),
                          ),
                          child: GamesWidget(
                            backgroundUrl: "https://i.stack.imgur.com/y9DpT.jpg",
                            gameName: "Test",
                            releaseDate: "4200 LKR",
                            gradient: GREEN_GRADIENT,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerTileContainer({
    String? title,
    String? releaseDate,
    double? rate,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtils.getDesignHeight(ScreenUtils.isStatusBarBig ? 135.35 : 173.35), // 205.68
      ),
      height: ScreenUtils.getDesignWidth(77.0),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR,
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          color: SUB_TEXT_COLOR,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtils.getDesignWidth(15.0),
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
                  title ?? "",
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
                SizedBox(
                  height: ScreenUtils.getDesignHeight(2.0),
                ),
                GradientText(
                  text: releaseDate != null ? DateFormat('dd/MM/yyyy').format(DateTime.parse(releaseDate)) : "",
                  gradient: PRIMARY_GRADIENT,
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ],
            ),
            Container(
              height: ScreenUtils.getDesignHeight(44.0),
              width: ScreenUtils.getDesignWidth(44.0),
              decoration: BoxDecoration(
                gradient: PRIMARY_GRADIENT,
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtils.getDesignHeight(3.0),
                    ),
                    child: Text(
                      "${rate ?? 0.0}",
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtils.getDesignWidth(2.0),
                  ),
                  SvgPicture.asset(
                    STAR_ICON,
                    height: ScreenUtils.getDesignHeight(13.0),
                    width: ScreenUtils.getDesignWidth(12.65),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _companyContainer() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(25.0),
          left: ScreenUtils.getDesignWidth(24.0),
          right: ScreenUtils.getDesignWidth(24.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtils.getDesignWidth(15.0),
        ),
        decoration: BoxDecoration(
          color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtils.getDesignHeight(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<GameDetailsModel>(
                    builder: (_, model, __) {
                      return Text(
                        "${model.gameDetails.developer != null ? model.gameDetails.developer![0].name : ""}",
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      );
                    },
                  ),
                  SizedBox(
                    height: ScreenUtils.getDesignHeight(2.0),
                  ),
                  Text(
                    "Company",
                    style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                          color: SUB_TEXT_COLOR,
                          fontSize: 12.0,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: PRIMARY_GRADIENT,
              ),
              padding: EdgeInsets.all(
                ScreenUtils.getDesignHeight(6.0),
              ),
              child: SvgPicture.asset(
                ARROW_RIGHT_ICON,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }

  Widget _platformContainer(String name) {
    return Container(
      height: ScreenUtils.getDesignHeight(31.0),
      width: ScreenUtils.getDesignWidth(84.0),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
        borderRadius: BorderRadius.circular(38.0),
      ),
      child: Center(
        child: Text(
          name,
          style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                fontSize: 8.0,
              ),
        ),
      ),
    );
  }

  Widget _subHeadingContainer({required String title, double? paddingTop}) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtils.getDesignHeight(paddingTop ?? 25.0),
      ),
      padding: EdgeInsets.only(
        left: ScreenUtils.getDesignWidth(24.0),
      ),
      width: double.infinity,
      height: ScreenUtils.getDesignHeight(54.0),
      color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).primaryTextTheme.headline3,
        ),
      ),
    );
  }

  Widget _genreListContainer({String? name, int? index}) {
    return Container(
      width: ScreenUtils.getDesignWidth(97.0),
      height: ScreenUtils.getDesignHeight(99.0),
      margin: EdgeInsets.only(
        left: ScreenUtils.getDesignWidth(index == 0 ? 24.0 : 16.0),
      ),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtils.getDesignWidth(57.0),
            height: ScreenUtils.getDesignHeight(57.0),
            color: Colors.amber,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtils.getDesignHeight(8.0),
            ),
            child: Text(name ?? "", style: Theme.of(context).primaryTextTheme.subtitle1),
          ),
        ],
      ),
    );
  }

  Widget _genreScreenshotContainer({String? imagePath, int? index}) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtils.getDesignWidth(index == 0 ? 24.0 : 15.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          width: ScreenUtils.getDesignWidth(235.0),
          height: ScreenUtils.getDesignHeight(130.0),
          placeholder: (context, url) => Center(
            child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: PRIMARY_COLOR,
              ),
            ),
          ),
          imageUrl: imagePath ?? "https://i.stack.imgur.com/y9DpT.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
