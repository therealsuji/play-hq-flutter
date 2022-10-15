import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';
import 'package:play_hq/view_models/onboarding/setup_purchase_account_view_model/purchase_account_model.dart';
import 'package:play_hq/widgets/custom_alert_button.dart';
import 'package:play_hq/widgets/custom_body.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_dotted_selector_widget.dart';
import 'package:play_hq/widgets/custom_expander_widget.dart';
import 'package:play_hq/widgets/game_picker_widget.dart';
import 'package:play_hq/widgets/custom_game_widget.dart';
import 'package:play_hq/widgets/custom_selecting_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/select_item_widget.dart';
import 'package:provider/provider.dart';

class SetupPurchaseAccountScreen extends StatefulWidget {
  @override
  _SetupPurchaseAccountScreenState createState() => _SetupPurchaseAccountScreenState();
}

class _SetupPurchaseAccountScreenState extends State<SetupPurchaseAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: (){},
        child:  Container(
            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(100), left: 24, right: 24),
            child: CustomButton(
                gradient: PRIMARY_GRADIENT,
                buttonText: 'Add Details',
                onPressed: () =>
                    Provider.of<SetupPurchaseAccountModel>(context, listen: false).performAPIRequest()))
      ),
        body: CustomBody(
      paddingLeft: 0.0,
      paddingRight: 0.0,
      paddingTop: 40.0,
      paddingBottom: 100.0,
      body: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    'Let\'s get Started',
                    isDynamic: false,
                    height: ScreenUtils.getDesignHeight(30),
                    width: ScreenUtils.getDesignWidth(180),
                    style: Theme.of(context).primaryTextTheme.headline1?.copyWith(fontFamily: Neusa),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: CustomTextWidget(
                      'Select what kind of games you like',
                      isDynamic: false,
                      height: ScreenUtils.getDesignHeight(20),
                      width: ScreenUtils.getDesignWidth(220),
                      style: Theme.of(context).primaryTextTheme.headline4?.copyWith(
                            fontFamily: CircularBook,
                            color: Colors.white.withOpacity(0.6),
                          ),
                    ),
                  ),
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
                        : value.genreCount == 3
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
                    onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false).changePlatformState(
                        Provider.of<SetupPurchaseAccountModel>(context, listen: false).currentPlatFormState == false
                            ? true
                            : false),
                    titleText: 'Platforms',
                    textWidth: ScreenUtils.getDesignWidth(55),
                    selectedText: val.totalPlatformCount == null || val.totalPlatformCount == 0
                        ? 'None Selected'
                        : val.totalPlatformCount == 3
                            ? 'Max Selected'
                            : val.totalPlatformCount.toString() + ' Selected',
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
                      itemCount: platforms.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                              .addSelectedPlatforms(platforms.indexOf(platforms[index]), platforms[index]),
                          child: CustomSelectingWidget(
                            titleText: platforms[index]['name'],
                            active: val.selectedPlatforms.contains(platforms.indexOf(platforms[index])),
                          ),
                        );
                      },
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
                    selectedText: val.releaseDateCount == null || val.releaseDateCount == 0
                        ? 'None Selected'
                        : val.releaseDateCount.toString() + ' Selected',
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
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                              .addReleaseDates(releaseDates.indexOf(releaseDates[index]), releaseDates[index]),
                          child: CustomSelectingWidget(
                            titleText: releaseDates[index]['name'],
                            active: val.selectedReleaseDates.contains(releaseDates.indexOf(releaseDates[index])),
                          ),
                        );
                      },
                    ));
              },
            ),
            Container(
              width: ScreenUtils.bodyWidth,
              margin: EdgeInsets.only(top: 30 , bottom: 50),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            'Any Games you\'d like to buy?',
                            isDynamic: false,
                            style: Theme.of(context).primaryTextTheme.headline3,
                            width: ScreenUtils.getDesignWidth(180),
                            height: ScreenUtils.getDesignHeight(20),
                          ),
                          Spacer(),
                          Consumer<SetupPurchaseAccountModel>(
                            builder: (_, val, __) {
                              return CustomTextWidget(
                                val.selectedGameList.length == 0
                                    ? 'None Selected'
                                    : val.selectedGameList.length.toString() + ' Selected',
                                isDynamic: false,
                                style: TextStyle(
                                    fontFamily: CircularBook,
                                    foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                                    fontSize: 10),
                                height: ScreenUtils.getDesignHeight(13),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    ChangeNotifierProvider.value(
                      value: Provider.of<SetupPurchaseAccountModel>(context),
                      child: CustomGamePicker(
                        gameType: SearchType.SETUP_PURCHASES,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
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
              onTap: () => Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                  .addSelectedGenres(index, genreList[index]),
              child: Consumer<SetupPurchaseAccountModel>(builder: (_, val, __) {
                print("Image Url ${genreList[index]['image_background']}");
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
