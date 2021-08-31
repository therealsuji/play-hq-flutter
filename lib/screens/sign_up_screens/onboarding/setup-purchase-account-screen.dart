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
import 'package:play_hq/widgets/custom-text-widget.dart';
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
        paddingTop: 40.0,
        body: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(height: ScreenUtils.getDesignHeight(30) , width: ScreenUtils.getDesignWidth(180), style: Theme.of(context).primaryTextTheme.headline1?.copyWith(fontFamily: Neusa), text: 'Let\'s get Started',),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: CustomTextWidget(height: ScreenUtils.getDesignHeight(20) , width: ScreenUtils.getDesignWidth(220), style: Theme.of(context).primaryTextTheme.headline4?.copyWith(fontFamily: CircularBook , color: Colors.white.withOpacity(0.6)), text: 'Select what kind of games you like',)),
                ],
              ),
            ),
            Consumer<SetupPurchaseAccountModel>(
              builder: (_, value, __) {
                return Container(
                  child: CustomExpanderWidget(
                    iconData: value.currentGenreState == false
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    state: value.currentGenreState,
                    onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false).changeGenreState(
                        Provider.of<SetupPurchaseAccountModel>(context, listen: false).currentGenreState == false
                            ? true
                            : false),
                    titleText: 'Genre',
                    selectedText: value.genreCount == null || value.genreCount == 0
                        ? 'None Selected'
                        : value.genreCount == 5
                        ? 'Max Selected'
                        : value.genreCount.toString() + ' Selected',
                    widget: _genreListWidget(),
                    textWidth: ScreenUtils.getDesignWidth(40),
                  ),
                );
              },
            ),
            Consumer<SetupPurchaseAccountModel>(
              builder: (_, val, __) {
                return CustomExpanderWidget(
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
                    titleText: 'Platform',
                    selectedText: val.totalPlatformCount == null || val.totalPlatformCount == 0
                        ? 'None Selected'
                        : val.totalPlatformCount == 5
                        ? 'Max Selected'
                        : val.totalPlatformCount.toString() + ' Selected',
                    textWidth: ScreenUtils.getDesignWidth(55),
                    widget: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _platformItem(
                              'assets/images/playstation.png',
                                  () => showPlatformBottomSheet('Select your PlayStation Console', playStationPlatforms,
                                  PlatformSelection.PlayStation)),
                          _platformItem(
                              'assets/images/nintendo.png',
                                  () => showPlatformBottomSheet(
                                  'Select your Nintendo Console', xboxPlatforms, PlatformSelection.Xbox)),
                          _platformItem(
                              'assets/images/xbox.png',
                                  () => showPlatformBottomSheet(
                                  'Select your Xbox Console', nintendoConsoles, PlatformSelection.Nintendo)),
                        ],
                      ),
                    ));
              },
            ),
            Consumer<SetupPurchaseAccountModel>(
              builder: (_, val, __) {
                return CustomExpanderWidget(
                    iconData: val.currentReleaseDateState == false
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    state: val.currentReleaseDateState,
                    onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false).changeReleaseDateState(
                        Provider.of<SetupPurchaseAccountModel>(context, listen: false).currentReleaseDateState == false
                            ? true
                            : false),
                    titleText: 'Release Dates',
                    textWidth: ScreenUtils.getDesignWidth(90),
                    selectedText: 'None Selected',
                    widget: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        mainAxisExtent: ScreenUtils.getDesignHeight(45.0),
                      ),
                      itemCount: releaseDates.length,
                      itemBuilder: (context , index){
                        return GestureDetector(
                          onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                              .addReleaseDates(releaseDates.indexOf(releaseDates[index]), releaseDates[index]['name']),
                          child: CustomSelectingWidget(
                            titleText:releaseDates[index]['name'],
                            active: val.selectedReleaseDates.contains(releaseDates.indexOf(releaseDates[index])),
                          ),
                        );
                      },
                    ));
              },
            ),
            Container(
              width: ScreenUtils.bodyWidth,
              decoration: BoxDecoration(
                color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
              ),
              margin: EdgeInsets.only(top: 30),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24 , vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          CustomTextWidget(text: 'Any Games you\'d like to buy?', style: Theme.of(context).primaryTextTheme.headline3, width: ScreenUtils.getDesignWidth(180), height: ScreenUtils.getDesignHeight(20),),
                          Spacer(),
                          CustomTextWidget(text: 'None Selected',style: TextStyle(
                              fontFamily: CircularBold,
                              foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                              fontSize: 10
                          ),
                            height: ScreenUtils.getDesignHeight(13),
                          ),
                        ],
                      ),
                    ),
                    _wishlistGames(),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(100), left: 24, right: 24),
                child: CustomButton(
                  gradient: PRIMARY_GRADIENT,
                  buttonText: 'Setup Sales',
                  onPressed: () => locator<NavigationService>().pushNamed(SALES_ACCOUNT_SCREEN),
                ))
          ],
        ),
      ],
      )
    );
  }

  showPlatformBottomSheet(String title, List<Map<String, dynamic>> list, PlatformSelection platform) async {
    SetupPurchaseAccountModel model = Provider.of<SetupPurchaseAccountModel>(context, listen: false);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: ScreenUtils.getDesignHeight(340),
            decoration: BoxDecoration(color: POP_UP_CONTAINER_COLOR, borderRadius: BorderRadius.circular(15.0)),
            child: ChangeNotifierProvider.value(
                value: model,
                child: _bottomSheet(title, list, platform)),
          );
        });
  }

  Widget _wishlistGames() {
    final model = Provider.of<SetupPurchaseAccountModel>(context);

    return Container(
      margin: EdgeInsets.only(top: 20),
      height: ScreenUtils.getDesignHeight(160),
      child: Row(
        children: [
          CustomDottedSelectorWidget(
            onPressed: () async{
              dynamic gameDetails = await Navigator.pushNamed(context, MAIN_SEARCH_SCREEN,
                  arguments: SearchGameScreens.SetupPurchase);
              if (gameDetails != null) {
                Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                    .addSelectedGame(gameDetails);
              }
            }
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

  Widget _platformItem(String image_path, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        width: ScreenUtils.getDesignWidth(100),
        child: Stack(
          children: [
            Container(
                height: ScreenUtils.getDesignHeight(115),
                width: ScreenUtils.getDesignWidth(100),
                child: Image.asset(
                  image_path,
                  fit: BoxFit.cover,
                )),
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
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30), left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              style: Theme.of(context).primaryTextTheme.headline5?.copyWith(fontSize: 16)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
            child: Consumer<SetupPurchaseAccountModel>(
              builder: (_ , val , __){
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                    mainAxisExtent: ScreenUtils.getDesignHeight(45.0),
                  ),
                  itemCount: list.length,
                  itemBuilder: (context , index){
                    return GestureDetector(
                      onTap: () {
                        val.addSelectedPlatforms(list.indexOf(list[index]), platform);
                      },
                      child: CustomSelectingWidget(
                          titleText: list[index]['name'],
                          active: platform == PlatformSelection.PlayStation
                              ? val.selectedPlaystationPlatforms.contains(list.indexOf(list[index]))
                              : platform == PlatformSelection.Xbox
                              ? val.selectedXboxPlatforms.contains(list.indexOf(list[index]))
                              : val.selectedNintendoPlatforms.contains(list.indexOf(list[index])))
                    );
                  },
                );
              },
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtils.getDesignHeight(40)),
            child: CustomButton(
              buttonText: 'Confirm',
              gradient: GREEN_GRADIENT,
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
                  backgroundColor: MAIN_CONTAINER_COLOR,
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
                                  buttonColor: UNSELECTED_CONTAINER_COLOR,
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
