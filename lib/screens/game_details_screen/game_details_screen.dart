import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/widgets/custom_image_slider_dart.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../../helpers/app_assets.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/app_enums.dart';
import '../../helpers/app_screen_utils.dart';
import '../../helpers/app_strings.dart';
import '../../helpers/app_utils.dart';
import '../../models/game_details_models/game_details_arguments.dart';
import '../../models/game_status.dart';
import '../../view_models/game_details/game_details_model.dart';
import '../../widgets/bottomSheets/platform_sheet.dart';
import '../../widgets/custom_body.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_game_widget.dart';
import '../../widgets/custom_text_widget.dart';
import '../../widgets/gradient_text_widget.dart';
import '../../widgets/horizontal_scroll_widget.dart';

class GameDetailsScreen extends StatefulWidget {
  final GameDetailsArguments? gameDetailsArguments;

  GameDetailsScreen({this.gameDetailsArguments});

  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GameDetailsViewModel>().getGameDetails(widget.gameDetailsArguments!.gameId ?? 0);
  }

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
              Consumer<GameDetailsViewModel>(
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
                    imageUrl:
                        model.gameDetails.backgroundImage ?? "https://i.stack.imgur.com/y9DpT.jpg",
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
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        BACK_ARROW_ICON,
                        height: ScreenUtils.getDesignHeight(27.0),
                      ),
                      onTap: () => Provider.of<GameDetailsViewModel>(context, listen: false)
                          .navigateMainScreen(),
                    ),
                  ),
                  Consumer<GameDetailsViewModel>(
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
                            Consumer<GameDetailsViewModel>(
                              builder: (_, status, __) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: ScreenUtils.getDesignHeight(25.0),
                                  ),
                                  child: _buttonContainer(status.gameStatus),
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              width: ScreenUtils.bodyWidth,
                              height: 1.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: PRIMARY_GRADIENT,
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(top: 30),
                            //   child: Row(
                            //     children: [
                            //       CustomTextWidget(
                            //         'Best Deals Today',
                            //         isDynamic: false,
                            //         width: ScreenUtils.getDesignWidth(120),
                            //         style: Theme.of(context)
                            //             .primaryTextTheme
                            //             .headline4,
                            //       ),
                            //       Spacer(),
                            //       GradientText(
                            //         'View All',
                            //         gradient: PRIMARY_GRADIENT,
                            //         style: Theme.of(context)
                            //             .primaryTextTheme
                            //             .headline4,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Consumer<GameDetailsViewModel>(
                            //   builder: (_, value, __) {
                            //     return Container(
                            //       margin: EdgeInsets.only(top: 15),
                            //       height: ScreenUtils.getDesignHeight(205),
                            //       child: ListView.separated(
                            //           itemBuilder:
                            //               (BuildContext context, int index) {
                            //             return ActiveGameSalesWidget(salesPayload: value.getSalesFromGame[index]);
                            //           },
                            //           scrollDirection: Axis.horizontal,
                            //           separatorBuilder:
                            //               (BuildContext context, int index) {
                            //             return SizedBox(
                            //               width: 15,
                            //             );
                            //           },
                            //           itemCount: value.getSalesFromGame.length),
                            //     );
                            //   },
                            // ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Row(
                                children: [
                                  CustomTextWidget(
                                    'Available Platforms',
                                    isDynamic: false,
                                    width: ScreenUtils.getDesignWidth(130),
                                    style: Theme.of(context).primaryTextTheme.headline4,
                                  )
                                ],
                              ),
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
                                return _platformContainer(
                                    model.gameDetails.platforms?[index].name ?? "");
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  _companyContainer(),
                  _subHeadingContainer(title: "Genre", paddingTop: 30.0),
                  Consumer<GameDetailsViewModel>(
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
                  Consumer<GameDetailsViewModel>(
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
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomImageSlider(listImagesModel: model.gameScreenshots.results, current: model.gameScreenshots.results!.indexOf(s))));
                                      },
                                      child: _genreScreenshotContainer(
                                        imagePath: s.image,
                                        index: model.gameScreenshots.results!.indexOf(s),
                                      ),
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
                    child: Consumer<GameDetailsViewModel>(
                      builder: (_, model, __) {
                        return Text(
                          model.gameDetails.description ?? "",
                          style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                                color: SUB_TEXT_COLOR,
                                fontSize: 13.0,
                              ),
                        );
                      },
                    ),
                  ),
                  _subHeadingContainer(title: "Similar Games"),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtils.getDesignHeight(10.0),
                    ),
                    child: Consumer<GameDetailsViewModel>(builder: (_, model, __) {
                      return Container(
                        height: ScreenUtils.getDesignHeight(160),
                        child: Skeleton(
                          isLoading: !model.hasInitialDataLoaded,
                          skeleton: SkeletonGamesListWidget(
                            height: ScreenUtils.getDesignHeight(160),
                            width: ScreenUtils.getDesignWidth(100),
                            count: 10,
                          ),
                          child: HorizontalScrollList(
                            itemCount: model.similarGames.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  GAME_DETAILS_SCREEN,
                                  arguments: GameDetailsArguments(
                                    gameId: model.similarGames[index].id,
                                  ),
                                ),
                                child: GamesWidget(
                                  backgroundUrl: model.similarGames[index].backgroundImage,
                                  title: model.similarGames[index].name,
                                  subTitle: model.similarGames[index].released,
                                  gradient: PRIMARY_GRADIENT,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttonContainer(GameStatus status) {
    if (status.gameLibrary) {
      return CustomButton(
        buttonText: "Remove from Library",
        buttonColor: Color(0xffe63946),
        height: ScreenUtils.getDesignHeight(40.0),
        textFontSize: 12.0,
        width: double.infinity,
        onPressed: () {
          showAlertDialog(
              context, "Are you sure?", "Do you really want to remove your game from your library?",
              () {
            Provider.of<GameDetailsViewModel>(context, listen: false)
                .deleteLibraryGame(widget.gameDetailsArguments!.gameId ?? 0);
          });
        },
      );
    } else if (status.wishList) {
      return CustomButton(
        buttonText: "Remove from Wishlist",
        buttonColor: Color(0xffe63946),
        height: ScreenUtils.getDesignHeight(40.0),
        textFontSize: 12.0,
        width: double.infinity,
        onPressed: () {
          showAlertDialog(context, "Are you sure?",
              "Do you really want to remove your game from your wishlist?", () {
            Provider.of<GameDetailsViewModel>(context, listen: false)
                .deleteWishListGame(widget.gameDetailsArguments!.gameId ?? 0);
          });
        },
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              buttonText: "Add to Wishlist",
              gradient: SECONDARY_GRADIENT,
              height: ScreenUtils.getDesignHeight(40.0),
              textFontSize: 10.0,
              onPressed: () {
                _showPlatformBottomSheet(
                  onPressed:
                      Provider.of<GameDetailsViewModel>(context, listen: false).addToWishList,
                );
              },
            ),
          ),
          SizedBox(
            width: ScreenUtils.getDesignWidth(15.0),
          ),
          Expanded(
            child: CustomButton(
              buttonText: "Add to Library",
              gradient: PRIMARY_GRADIENT,
              height: ScreenUtils.getDesignHeight(40.0),
              textFontSize: 10.0,
              onPressed: () {
                _showPlatformBottomSheet(
                  onPressed: Provider.of<GameDetailsViewModel>(context, listen: false).addToLibrary,
                );
              },
            ),
          ),
        ],
      );
    }
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
                  releaseDate != null
                      ? releaseDate.isNotEmpty
                          ? DateTime.parse(releaseDate).format('dd-MM-yyyy')
                          : "Not Mentioned"
                      : "",
                  gradient: PRIMARY_GRADIENT,
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ],
            ),
            Container(
              height: ScreenUtils.getDesignHeight(44.0),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtils.getDesignWidth(6.0),
              ),
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
                  Consumer<GameDetailsViewModel>(
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
                fontSize: 10.0,
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
            child: Text(name ?? "",
                style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize: 12)),
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

  _showPlatformBottomSheet({VoidCallback? onPressed}) async {
    final model = Provider.of<GameDetailsViewModel>(context, listen: false);
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
                bottomSheetType: PlatformBottomSheetType.GAME_DETAIL_ADD,
                onPressed: onPressed,
                platformList: model.gameDetails.platforms ?? [],
              );
            },
          ),
        );
      },
    );
  }

  showAlertDialog(BuildContext context, String title, String message, VoidCallback clickedYes) {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    Widget okButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        clickedYes();
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [cancelButton, okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
