import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-constants.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/custom-expander-widget.dart';
import 'package:play_hq/widgets/custom-selecting-widget.dart';
import 'package:play_hq/widgets/select-game-item-widget.dart';
import 'package:provider/provider.dart';

class GameTypes extends StatefulWidget {
  @override
  _GameTypesState createState() => _GameTypesState();
}

class _GameTypesState extends State<GameTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtils.getDesignHeight(40), left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Let\'s get Started',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: HEADER_TEXT_COLOR,
                          fontFamily: Neusa),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'Select what kind of games you like',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HEADER_TEXT_COLOR.withOpacity(0.6),
                          fontFamily: CircularBook),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<SelectGameTypesModel>(
              builder: (_, value, __) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: CustomExpanderWidget(
                    height: value.currentGenreState == false
                        ? ScreenUtils.getDesignHeight(50)
                        : ScreenUtils.getDesignHeight(210),
                    iconData: value.currentGenreState == false
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    state: value.currentGenreState,
                    onTap: () => Provider.of<SelectGameTypesModel>(context,
                            listen: false)
                        .changeGenreState(Provider.of<SelectGameTypesModel>(
                                        context,
                                        listen: false)
                                    .currentGenreState ==
                                false
                            ? true
                            : false),
                    titleText: 'Select Preferred Genre',
                    selectedText: 'None Selected',
                    widget: _genreListWidget(),
                  ),
                );
              },
            ),
            Consumer<SelectGameTypesModel>(
              builder: (_, val, __) {
                return CustomExpanderWidget(
                    height: val.currentPlatFormState == false
                        ? ScreenUtils.getDesignHeight(50)
                        : ScreenUtils.getDesignHeight(140),
                    iconData: val.currentPlatFormState == false
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    state: val.currentPlatFormState,
                    onTap: () => Provider.of<SelectGameTypesModel>(context,
                            listen: false)
                        .changePlatformState(Provider.of<SelectGameTypesModel>(
                                        context,
                                        listen: false)
                                    .currentPlatFormState ==
                                false
                            ? true
                            : false),
                    titleText: 'Choose your Platform',
                    selectedText: 'None Selected',
                    widget: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: ScreenUtils.getDesignHeight(70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => showPlatformBottomSheet(
                                  'Select your PlayStation Console',
                                  playStationPlatforms),
                              child: _platformItem(
                                  'PlayStation',
                                  PLAYSTATION_COLOR,
                                  'assets/images/playstation-controller.png')),
                          _platformItem('Xbox', XBOX_COLOR,
                              'assets/images/xbox-controller.png'),
                          _platformItem('Nintendo', NINTENDO_COLOR,
                              'assets/images/switch-controller.png'),
                        ],
                      ),
                    ));
              },
            ),
            Consumer<SelectGameTypesModel>(
              builder: (_, val, __) {
                return CustomExpanderWidget(
                    height: val.currentReleaseDateState == false
                        ? ScreenUtils.getDesignHeight(50)
                        : ScreenUtils.getDesignHeight(160),
                    iconData: val.currentReleaseDateState == false
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    state: val.currentReleaseDateState,
                    onTap: () => Provider.of<SelectGameTypesModel>(context,
                            listen: false)
                        .changeReleaseDateState(
                            Provider.of<SelectGameTypesModel>(context,
                                            listen: false)
                                        .currentReleaseDateState ==
                                    false
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
                              onTap: () => Provider.of<SelectGameTypesModel>(
                                      context,
                                      listen: false)
                                  .addReleaseDates(releaseDates.indexOf(e)),
                              child: CustomSelectingWidget(
                                titleText: e,
                                active: val.selectedReleaseDates
                                    .contains(releaseDates.indexOf(e)),
                              ),
                            );
                          }).toList()),
                    ));
              },
            ),
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtils.getDesignHeight(30), left: 24),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Choose the games you want',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: CircularBook,
                          color: Colors.white,
                          fontSize: 16)),
                  TextSpan(
                      text: ' (Wishlist Games)',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: CircularBook,
                          color: PRIMARY_COLOR,
                          fontSize: 16)),
                ]),
              ),
            ),
            _wishlistGames()
          ],
        ),
      ),
    );
  }

  showPlatformBottomSheet(String title, List<String> list) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: ScreenUtils.getDesignHeight(300),
            decoration: BoxDecoration(
                color: CONTAINER_COLOR,
                borderRadius: BorderRadius.circular(15.0)),
            child: _bottomSheet(title, list),
          );
        });
  }

  Widget _wishlistGames() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 24, right: 24),
      child: Row(
        children: [
          DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(5),
              color: CONTAINER_COLOR,
              dashPattern: [10, 6],
              strokeWidth: 3,
              child: Container(
                width: ScreenUtils.getDesignWidth(100),
                height: ScreenUtils.getDesignHeight(140),
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: PRIMARY_COLOR
                        ),
                        child: Icon(Icons.add , color: Colors.white , size: 25,),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Select Game' , style: TextStyle(fontSize: 15 , fontFamily: CircularBook , fontWeight: FontWeight.w700 , color: Colors.white),),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _platformItem(String title, Color color, String image_path) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(3.0), color: color),
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
            decoration: BoxDecoration(
                color: BACKGROUND_COLOR.withOpacity(0.6),
                borderRadius: BorderRadius.circular(3.0)),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: Neusa,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _genreListWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
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
              onTap: () =>
                  Provider.of<SelectGameTypesModel>(context, listen: false)
                      .addSelectedGenres(index),
              child: Consumer<SelectGameTypesModel>(builder: (_, val, __) {
                return SelectGameItem(
                  isSelected: val.selectedGenres.contains(index),
                  titleText: genreList[index]['name'],
                  imageURL: genreList[index]['image_background'],
                );
              }),
            );
          }),
    );
  }

  Widget _bottomSheet(String title, List<String> list) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(40), left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: Neusa,
                  fontSize: 18,
                  color: Colors.white),
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
                    Provider.of<SelectGameTypesModel>(context, listen: false)
                        .addSelectedPlatforms(list.indexOf(e));
                  },
                  child: ChangeNotifierProvider.value(
                    value: Provider.of<SelectGameTypesModel>(context),
                    child: Consumer<SelectGameTypesModel>(
                      builder: (_, val, __) {
                        return CustomSelectingWidget(
                          titleText: e,
                          active:
                              val.selectedPlatforms.contains(list.indexOf(e)),
                        );
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
}
