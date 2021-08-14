import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-constants.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/purchase-account-model.dart';
import 'package:play_hq/widgets/custom-alert-button.dart';
import 'package:play_hq/widgets/custom-body.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/custom-dotted-selector-widget.dart';
import 'package:play_hq/widgets/custom-expander-widget.dart';
import 'package:play_hq/widgets/custom-game-widget.dart';
import 'package:play_hq/widgets/custom-selecting-widget.dart';
import 'package:play_hq/widgets/custom-smaller-button-widget.dart';
import 'package:play_hq/widgets/select-game-item-widget.dart';
import 'package:play_hq/widgets/select-item-widget.dart';
import 'package:provider/provider.dart';

class SetupPurchaseAccountScreen extends StatefulWidget {
  @override
  _SetupPurchaseAccountScreenState createState() => _SetupPurchaseAccountScreenState();
}

class _SetupPurchaseAccountScreenState extends State<SetupPurchaseAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        paddingLeft: 0.0,
        paddingRight: 0.0,
        paddingTop: 0.0,
        body: [
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: ScreenUtils.totalBodyHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Let\'s get Started',
                            style: Theme.of(context).primaryTextTheme.headline1?.copyWith(fontFamily: Neusa),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            'Select what kind of games you like',
                            style: Theme.of(context).primaryTextTheme.headline4?.copyWith(fontFamily: CircularBook , color: Colors.white.withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer<SetupPurchaseAccountModel>(
                    builder: (_, value, __) {
                      return Container(
                        child: CustomExpanderWidget(
                          height: value.currentGenreState == false
                              ? ScreenUtils.getDesignHeight(55)
                              : ScreenUtils.getDesignHeight(210),
                          iconData: value.currentGenreState == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          state: value.currentGenreState,
                          onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false).changeGenreState(
                              Provider.of<SetupPurchaseAccountModel>(context, listen: false).currentGenreState == false
                                  ? true
                                  : false),
                          titleText: 'Select Preferred Genre',
                          selectedText: value.genreCount == null || value.genreCount == 0
                              ? 'None Selected'
                              : value.genreCount == 5
                              ? 'Max Selected'
                              : value.genreCount.toString() + ' Selected',
                          widget: _genreListWidget(),
                        ),
                      );
                    },
                  ),
                  Consumer<SetupPurchaseAccountModel>(
                    builder: (_, val, __) {
                      return CustomExpanderWidget(
                          height: val.currentPlatFormState == false
                              ? ScreenUtils.getDesignHeight(55)
                              : ScreenUtils.getDesignHeight(140),
                          iconData: val.currentPlatFormState == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          state: val.currentPlatFormState,
                          onTap: () {
                            Provider.of<SetupPurchaseAccountModel>(context, listen: false).changePlatformState(
                                Provider.of<SetupPurchaseAccountModel>(context, listen: false).currentPlatFormState == false
                                    ? true
                                    : false);
                          },
                          titleText: 'Choose your Platform',
                          selectedText: val.totalPlatformCount == null || val.totalPlatformCount == 0
                              ? 'None Selected'
                              : val.totalPlatformCount == 5
                              ? 'Max Selected'
                              : val.totalPlatformCount.toString() + ' Selected',
                          widget: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            height: ScreenUtils.getDesignHeight(70),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _platformItem(
                                    'PlayStation',
                                    PLAYSTATION_COLOR,
                                    'assets/images/playstation-controller.png',
                                        () => showPlatformBottomSheet('Select your PlayStation Console', playStationPlatforms,
                                        PlatformSelection.PlayStation)),
                                _platformItem(
                                    'Xbox',
                                    XBOX_COLOR,
                                    'assets/images/xbox-controller.png',
                                        () => showPlatformBottomSheet(
                                        'Select your Xbox Console', xboxPlatforms, PlatformSelection.Xbox)),
                                _platformItem(
                                    'Nintendo',
                                    NINTENDO_COLOR,
                                    'assets/images/switch-controller.png',
                                        () => showPlatformBottomSheet(
                                        'Select your Nintendo Console', nintendoConsoles, PlatformSelection.Nintendo)),
                              ],
                            ),
                          ));
                    },
                  ),
                  Consumer<SetupPurchaseAccountModel>(
                    builder: (_, val, __) {
                      return CustomExpanderWidget(
                          height: val.currentReleaseDateState == false
                              ? ScreenUtils.getDesignHeight(55)
                              : ScreenUtils.getDesignHeight(160),
                          iconData: val.currentReleaseDateState == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          state: val.currentReleaseDateState,
                          onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false).changeReleaseDateState(
                              Provider.of<SetupPurchaseAccountModel>(context, listen: false).currentReleaseDateState == false
                                  ? true
                                  : false),
                          titleText: 'Choose Release Date',
                          selectedText: 'None Selected',
                          widget: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            height: ScreenUtils.getDesignHeight(70),
                            child: Wrap(
                                direction: Axis.horizontal,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                spacing: 15,
                                runSpacing: 20,
                                children: releaseDates.map((e) {
                                  return GestureDetector(
                                    onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                                        .addReleaseDates(releaseDates.indexOf(e), e['name']),
                                    child: CustomSelectingWidget(
                                      titleText: e['name'],
                                      active: val.selectedReleaseDates.contains(releaseDates.indexOf(e)),
                                    ),
                                  );
                                }).toList()),
                          ));
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30), left: 24),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Choose the games you want',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontFamily: CircularBook, color: Colors.white, fontSize: 16)),
                        TextSpan(
                            text: ' (Wishlist Games)',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontFamily: CircularBook, color: PRIMARY_COLOR, fontSize: 16)),
                      ]),
                    ),
                  ),
                  _wishlistGames(),
                  Container(
                      margin: EdgeInsets.only(bottom: ScreenUtils.getDesignHeight(30), top: ScreenUtils.getDesignHeight(160), left: 24, right: 24),
                      child: CustomButton(
                        buttonColor: PRIMARY_COLOR,
                        buttonText: 'Setup Sales',
                        textFontSize: 16,
                        onPressed: () => locator<NavigationService>().pushNamed(SALES_ACCOUNT_SCREEN),
                      ))
                ],
              ),
            ),
          ),
        ),
      ],

      )
    );
  }

  showPlatformBottomSheet(String title, List<Map<String, dynamic>> list, PlatformSelection platform) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: ScreenUtils.getDesignHeight(300),
            decoration: BoxDecoration(color: CONTAINER_COLOR, borderRadius: BorderRadius.circular(15.0)),
            child: _bottomSheet(title, list, platform),
          );
        });
  }

  Widget _wishlistGames() {
    final model = Provider.of<SetupPurchaseAccountModel>(context);

    return Container(
      margin: EdgeInsets.only(top: 20, left: 24, right: 24),
      height: ScreenUtils.getDesignHeight(160),
      child: Row(
        children: [
          CustomDottedSelectorWidget(
            onPressed: () =>
                locator<NavigationService>().pushNamed(SEARCH_SCREEN, args: SearchGameScreens.SetupPurchase),
          ),
          ChangeNotifierProvider.value(
            value: model,
            child: Consumer<SetupPurchaseAccountModel>(
              builder: (_, val, __) {
                print(val.selectedGameList);
                return val.selectedGameList.isEmpty
                    ? Container()
                    : Expanded(
                        child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 15,
                              );
                            },
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: val.selectedGameList.length,
                            itemBuilder: (context, index) {
                              return GamesWidget(
                                gameName: val.selectedGameList[index].name,
                                color: PRIMARY_COLOR,
                                backgroundUrl: val.selectedGameList[index].image,
                                releaseDate: val.selectedGameList[index].released,
                              );
                            }),
                      );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _platformItem(String title, Color color, String image_path, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.0), color: color),
        width: ScreenUtils.getDesignWidth(100),
        child: Stack(
          children: [
            Container(
                height: ScreenUtils.getDesignHeight(70),
                width: ScreenUtils.getDesignWidth(100),
                child: Image.asset(
                  image_path,
                  fit: BoxFit.cover,
                )),
            Container(
              decoration:
                  BoxDecoration(color: BACKGROUND_COLOR.withOpacity(0.6), borderRadius: BorderRadius.circular(3.0)),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontFamily: Neusa, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genreListWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: ScreenUtils.getDesignHeight(130),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 15,
            );
          },
          itemCount: genreList.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false).addSelectedGenres(index),
              child: Consumer<SetupPurchaseAccountModel>(builder: (_, val, __) {
                return SelectItem(
                  isSelected: val.selectedGenres.contains(index),
                  titleText: genreList[index]['name'],
                  imageURL: genreList[index]['image_background'],
                );
              }),
            );
          }),
    );
  }

  Widget _bottomSheet(String title, List<Map<String, dynamic>> list, PlatformSelection platform) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40), left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: Neusa, fontSize: 18, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 15,
              runSpacing: 20,
              children: list.map((e) {
                return GestureDetector(
                  onTap: () {
                    Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                        .addSelectedPlatforms(list.indexOf(e), platform);
                  },
                  child: ChangeNotifierProvider.value(
                    value: Provider.of<SetupPurchaseAccountModel>(context),
                    child: Consumer<SetupPurchaseAccountModel>(
                      builder: (_, val, __) {
                        return CustomSelectingWidget(
                            titleText: e['name'],
                            active: platform == PlatformSelection.PlayStation
                                ? val.selectedPlaystationPlatforms.contains(list.indexOf(e))
                                : platform == PlatformSelection.Xbox
                                    ? val.selectedXboxPlatforms.contains(list.indexOf(e))
                                    : val.selectedNintendoPlatforms.contains(list.indexOf(e)));
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtils.getDesignHeight(40)),
            child: CustomButton(
              buttonText: 'Confirm',
              buttonColor: PRIMARY_COLOR,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> customAlert({required BuildContext context, String? title, String? contentBody}) {
    return showGeneralDialog<void>(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  backgroundColor: CONTAINER_COLOR,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  content: Container(
                    margin: EdgeInsets.symmetric(vertical: ScreenUtils.getDesignHeight(15)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: ScreenUtils.getDesignHeight(60),
                          width: ScreenUtils.getDesignWidth(60),
                          child: Image.asset('assets/images/confused-emoji.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            title!,
                            style: TextStyle(
                                color: Colors.white, fontFamily: Neusa, fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: ScreenUtils.bodyWidth,
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            contentBody!,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: CircularBook,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                            width: ScreenUtils.bodyWidth,
                            margin: EdgeInsets.only(top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomAlertButton(
                                  buttonColor: UNSELECTED_ITEM_COLOR,
                                  buttonText: 'I only Sell',
                                ),
                                CustomAlertButton(
                                  buttonColor: PRIMARY_COLOR,
                                  buttonText: 'I wanna Buy!',
                                ),
                              ],
                            )),
                      ],
                    ),
                  )),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return;
        } as Widget Function(BuildContext, Animation<double>, Animation<double>));
  }
}
