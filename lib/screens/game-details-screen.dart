import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:play_hq/helpers/app-assets.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/game_details/i_game_details_model.dart';
import 'package:play_hq/widgets/custom-body.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
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
    Provider.of<IGameDetailsModel>(context, listen: false).getGameDetails(43);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        paddingLeft: 0.0,
        paddingTop: 0.0,
        paddingRight: 0.0,
        body: [
          Stack(
            children: [
              Consumer<IGameDetailsModel>(
                builder: (_,model,__) {
                  return CachedNetworkImage(
                    height: ScreenUtils.getDesignHeight(293.0),
                    width: double.infinity,
                    placeholder: (context, url) => Center(
                      child: Container(height: 50, width: 50,
                        child: CircularProgressIndicator(color: PRIMARY_COLOR,),
                      ),
                    ),
                    imageUrl: model.gameDetails.backgroundImage ?? "https://i.stack.imgur.com/y9DpT.jpg",
                    fit: BoxFit.cover,
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtils.getDesignHeight(10.0),
                      left: ScreenUtils.getDesignWidth(24.0),
                      right: ScreenUtils.getDesignWidth(24.0),
                    ),
                    // TODO: ADD BELL SVG
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset(
                            BACK_ARROW,
                            height: ScreenUtils.getDesignHeight(27.0),
                          ),
                          onTap: () {
                            Provider.of<IGameDetailsModel>(context, listen: false).navigateMainScreen();
                          },
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(
                            BACK_ARROW,
                            height: ScreenUtils.getDesignHeight(27.0),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Consumer<IGameDetailsModel>(
                    builder: (_,model,__) {
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
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenUtils.getDesignHeight(15.0),
                              ),
                              child: Wrap(
                                runSpacing: 5.0,
                                spacing: 10.0,
                                direction: Axis.horizontal,
                                children: model.gameDetails.platforms!.map((e) {
                                  return _platformContainer(e.name ?? "");
                                }).toList(),
                              ),
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
                    // TODO: CORRECT FONT FAMILY
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
                  // TODO: ADD CORRECT DETAILS
                  _companyContainer(),
                  _subHeadingContainer(title: "Genre", paddingTop: 30.0),
                  _subHeadingContainer(title: "Game Screenshots"),
                  _subHeadingContainer(title: "Description"),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtils.getDesignHeight(15.0),
                      left: ScreenUtils.getDesignWidth(24.0),
                      right: ScreenUtils.getDesignWidth(24.0),
                    ),
                    child: Consumer<IGameDetailsModel>(
                      builder: (_,model,__) {
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
        top: ScreenUtils.getDesignHeight(205.68),
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
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                SizedBox(height: ScreenUtils.getDesignHeight(2.0),),
                GradientText(
                  text: releaseDate != null
                      ? DateFormat('dd/MM/yyyy').format(DateTime.parse(releaseDate)) : "",
                  gradient: PRIMARY_GRADIENT,
                  style: Theme.of(context).primaryTextTheme.headline3,
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
                  SizedBox(width: ScreenUtils.getDesignWidth(2.0),),
                  SvgPicture.asset(
                    STAR,
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
        height: ScreenUtils.getDesignHeight(64.0),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sony Interactive Entertainment",
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                SizedBox(height: ScreenUtils.getDesignHeight(2.0),),
                Text(
                  "Company",
                  style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                    color: SUB_TEXT_COLOR,
                    fontSize: 12.0,
                  ),
                ),
              ],
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
                ARROW_RIGHT,
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

  Widget _subHeadingContainer({
    required String title,
    double? paddingTop
  }) {
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
}