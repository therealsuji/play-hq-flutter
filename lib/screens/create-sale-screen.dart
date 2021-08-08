import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-assets.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';
import 'package:play_hq/widgets/create-sale-confirm-bottom-sheet-widget.dart';
import 'package:play_hq/widgets/custom-body.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/custom-dotted-selector-widget.dart';
import 'package:play_hq/widgets/custom-textfield-widget.dart';
import 'package:play_hq/widgets/create-sale-bottom-sheet-widget.dart';
import 'package:play_hq/widgets/select-game-item-widget.dart';
import 'package:provider/provider.dart';

class CreateSaleScreen extends StatefulWidget {
  @override
  _CreateSaleScreenState createState() => _CreateSaleScreenState();
}

class _CreateSaleScreenState extends State<CreateSaleScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: BACKGROUND_COLOR,
      body: CustomBody(
        paddingLeft: 0.0,
        paddingRight: 0.0,
        body: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create a Sale",
                        style: Theme.of(context).primaryTextTheme.headline6?.copyWith(fontFamily: Neusa),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          "Create a sale so you can sell your game super fast",
                          style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(
                                color: Color(0xffB5BDD5).withOpacity(0.8),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(24)),
                  margin: const EdgeInsets.only(top: 25.0),
                  height: ScreenUtils.getDesignHeight(124.0),
                  child: Row(
                    children: [
                      Consumer<CreateSaleModel>(builder: (_, model, __) {
                        return Expanded(
                          child: ListView.separated(
                            itemCount: model.gameList.length + 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, idx) {
                              if (idx == 0) {
                                return GestureDetector(
                                  onTap: () async {
                                    var gameDetails = await locator<NavigationService>()
                                        .pushNamed(SEARCH_SCREEN, args: SearchGameScreens.CreateSales);
                                    if (gameDetails != null) {
                                      await showSalesBottomSheet();
                                      Provider.of<CreateSaleModel>(context, listen: false)
                                          .addGame(gameDetails['id'], gameDetails['name'], gameDetails['image']);
                                    }
                                  },
                                  child: CustomDottedSelectorWidget(
                                    filled: true,
                                  ),
                                );
                              }
                              return GestureDetector(
                                onTap: () async {
                                  // set the selected game so the bottom sheet knows that it should be in the update state
                                  model.setSelectedGame(idx - 1);
                                  await showSalesBottomSheet();
                                  // once the update is completed set clear bottomsheets state
                                  model.setSelectedGame(null);
                                },
                                child: SelectGameItem(
                                  imageURL: model.gameList[idx - 1].boxImage,
                                  titleText: model.gameList[idx - 1].title,
                                  isSelected: (idx - 1) == model.selectedGame,
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              if (index == 0) return Container();
                              return SizedBox(
                                width: ScreenUtils.getDesignWidth(15.0),
                              );
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sale Price ",
                              style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Neusa,
                                  ),
                            ),
                            Consumer<CreateSaleModel>(
                              builder: (_, model, __) {
                                return Text(
                                  model.gameList.length > 0 ? "${model.gameList.length}x Games" : '',
                                  style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                                        color: PRIMARY_COLOR,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Neusa,
                                      ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Consumer<CreateSaleModel>(builder: (_, model, __) {
                        return CustomTextfieldWidget(
                          type: TextInputType.number,
                          hideText: false,
                          onChanged: (value) => value != "" ? model.setPrice(double.parse(value)) : model.setPrice(0),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Price Negotaible?",
                                style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Neusa,
                                    )),
                            Consumer<CreateSaleModel>(
                              builder: (_, model, __) {
                                return CupertinoSwitch(
                                  activeColor: PRIMARY_COLOR,
                                  onChanged: (bool value) => model.setIsNegotiable(value),
                                  value: model.isNegotiable,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                        child: Text(
                          'Other remarks',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: CircularBook),
                        ),
                      ),
                      CustomTextfieldWidget(
                        type: TextInputType.multiline,
                        hideText: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Selector<CreateSaleModel, bool>(
                            selector: (_, provider) => provider.isFormValid,
                            builder: (_, formValid, __) {
                              return CustomButton(
                                onPressed: () {
                                  // showCompleteDialog();
                                  if (formValid) {
                                    showSalesConfirmBottomSheet();
                                  }
                                },
                                buttonText: "Create Sale",
                                buttonColor: formValid ? null : Colors.grey,
                                gradient: formValid ? GREEN_GRADIENT : null,
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> showSalesBottomSheet() async {
    CreateSaleModel model = Provider.of<CreateSaleModel>(context, listen: false);
    await showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: model,
          child: CreateSaleBottomSheetWidget(),
        );
      },
    );
  }

  void showCompleteDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: CONTAINER_COLOR,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            actionsPadding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: ScreenUtils.getDesignHeight(50.0),
                  width: ScreenUtils.getDesignWidth(50.0),
                  padding: EdgeInsets.all(ScreenUtils.getDesignWidth(15.0)),
                  decoration: BoxDecoration(color: TURQUOISE_BLUE_COLOR, shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    TICK_MARK,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "And We're Done",
                        style: Theme.of(context).primaryTextTheme.headline1?.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Image.asset(
                          SMILE_EMOJI,
                          height: ScreenUtils.getDesignHeight(25.0),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Your Games are up for sale! Awesomee Work! You will start getting notifications once you start getting potential buyers, Until then Happy Gaming!",
                    style: Theme.of(context).primaryTextTheme.subtitle1?.copyWith(fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            actions: [
              CustomButton(
                  buttonText: "Back to Home",
                  onPressed: () => Navigator.pushReplacementNamed(context, MAIN_SCREEN),
                  gradient: PRIMARY_GRADIENT),
            ],
          );
        });
  }

  Future<void> showSalesConfirmBottomSheet() async {
    CreateSaleModel model = Provider.of<CreateSaleModel>(context, listen: false);
    await showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: model,
          child: CreateSaleConfirmBottomSheet(),
        );
      },
    );
  }
}
