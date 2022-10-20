import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/screens/create_sale/widgets/update_game_widget.dart';
import 'package:play_hq/services/dialog_service.dart';
import 'package:play_hq/view_models/onboarding/setup_purchase_account_view_model/purchase_account_model.dart';
import 'package:play_hq/view_models/onboarding/setup_sales_account_view_model/sales-account-model.dart';
import 'package:play_hq/view_models/sales/create_sale/create_sale_model.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

import '../injection_container.dart';
import 'game_picker_details_widget.dart';

class CustomGamePicker extends StatefulWidget {
  final SearchType? gameType;
  final double? bottomMargin;

  CustomGamePicker({this.gameType, this.bottomMargin = 30});

  @override
  _CustomGamePickerState createState() => _CustomGamePickerState();
}

class _CustomGamePickerState extends State<CustomGamePicker> {
  ScrollController? _sliderController;
  double _selectingWidgetWidth = ScreenUtils.getDesignWidth(120);
  double _selectingWidgetHeight = ScreenUtils.getDesignHeight(170);
  double _selectingWidgetleftPos = 24;
  Color _containerColor = Colors.transparent;
  Color _borderColor = FILL_COLOR;
  double _radius = 5;
  double _margin = 0;

  @override
  void initState() {
    _sliderController = ScrollController();
    _sliderController!.addListener(_scroller);
    super.initState();
  }

  _scroller() {
    setState(() {
      var _t = (_sliderController!.position.pixels.clamp(0, 200) / 2) / 100;
      _selectingWidgetWidth =
          lerpDouble(ScreenUtils.getDesignWidth(120), ScreenUtils.getDesignWidth(70), _t)!;
      _selectingWidgetHeight =
          lerpDouble(ScreenUtils.getDesignHeight(170), ScreenUtils.getDesignHeight(65), _t)!;
      _selectingWidgetleftPos = lerpDouble(24, 0, _t)!;
      _margin = lerpDouble(0, 24, _t)!;
      _containerColor = Color.lerp(Colors.transparent, MAIN_CONTAINER_COLOR, _t)!;
      _borderColor = Color.lerp(FILL_COLOR, Colors.transparent, _t * 3)!;
      _radius = lerpDouble(5, 50, _t)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
          child: Padding(
        padding:
            EdgeInsets.only(top: ScreenUtils.getDesignHeight(15), bottom: widget.bottomMargin!),
        child: Stack(
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(170),
              margin: EdgeInsets.only(left: _margin, right: 24),
              child: _getGameType(widget.gameType!),
            ),
            _searchGameType()
          ],
        ),
      )),
    );
  }

  Widget _searchGameType() {
    return Positioned.fill(
      left: _selectingWidgetleftPos,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Consumer<CreateSaleModel>(
            builder: (_, val, __) {
              return GestureDetector(
                  onTap: () async {
                    switch (widget.gameType) {
                      case SearchType.CREATE_SALE:
                        if (val.gameCount >= 3) {
                          showGameCapAlert(context);
                        } else {
                          dynamic salesResult = await Navigator.pushNamed(
                              context, MAIN_SEARCH_SCREEN,
                              arguments: widget.gameType);
                          Provider.of<CreateSaleModel>(context, listen: false)
                              .checkGame(salesResult as GameElement);
                          Provider.of<CreateSaleModel>(context, listen: false).isAdded
                              ? showAlertDialog(context)
                              : Provider.of<CreateSaleModel>(context, listen: false)
                                  .addSelectedGame(salesResult);
                        }
                        break;
                      case SearchType.SETUP_PURCHASES:
                        dynamic purchaseResult = await Navigator.pushNamed(
                            context, MAIN_SEARCH_SCREEN,
                            arguments: widget.gameType);
                        Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                            .addSelectedGame(purchaseResult as GamePreferencesRequest);
                        break;
                      case SearchType.SETUP_SALES:
                        dynamic saleResult = await Navigator.pushNamed(context, MAIN_SEARCH_SCREEN,
                            arguments: widget.gameType);
                        Provider.of<SetupSalesViewModel>(context, listen: false)
                            .addSelectedGame(saleResult as GamePreferencesRequest);
                        break;
                      default:
                        break;
                    }
                  },
                  child: _selectingWidget(_selectingWidgetHeight, _selectingWidgetWidth));
            },
          )),
    );
  }

  Widget _getGameType(SearchType game) {
    switch (game) {
      case SearchType.SETUP_PURCHASES:
        return ChangeNotifierProvider.value(
          value: Provider.of<SetupPurchaseAccountModel>(context),
          child: Consumer<SetupPurchaseAccountModel>(
            builder: (_, val, __) {
              return Container(
                child: Consumer<SetupPurchaseAccountModel>(
                  builder: (_, values, __) {
                    return ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: ScreenUtils.getDesignWidth(15));
                        },
                        padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(160)),
                        controller: _sliderController,
                        itemCount: values.selectedGameList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GamePickerGames(
                            backgroundUrl: values.selectedGameList[index].game.backgroundImage,
                            gameName: values.selectedGameList[index].game.title,
                            releaseDate: values.selectedGameList[index].game.releaseDate,
                          );
                        });
                  },
                ),
              );
            },
          ),
        );
      case SearchType.SETUP_SALES:
        return ChangeNotifierProvider.value(
          value: Provider.of<SetupSalesViewModel>(context),
          child: Consumer<SetupSalesViewModel>(
            builder: (_, val, __) {
              return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: ScreenUtils.getDesignWidth(15));
                  },
                  padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(160)),
                  controller: _sliderController,
                  itemCount: val.selectedGameList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GamePickerGames(
                      backgroundUrl: val.selectedGameList[index].game.boxCover,
                      gameName: val.selectedGameList[index].game.title,
                      releaseDate: val.selectedGameList[index].game.releaseDate,
                    );
                  });
            },
          ),
        );
      case SearchType.CREATE_SALE:
        return Consumer<CreateSaleModel>(
          builder: (_, val, __) {
            return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: ScreenUtils.getDesignWidth(15));
                },
                padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(160)),
                controller: _sliderController,
                itemCount: val.selectedGameList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context2, int index) {
                  return GestureDetector(
                    onTap: () => showBottomSheet(gameId: val.selectedGameList[index].game.apiId!),
                    child: GamePickerGames(
                      backgroundUrl: val.selectedGameList[index].game.boxCover,
                      gameName: val.selectedGameList[index].game.title,
                      releaseDate: val.selectedGameList[index].statusName,
                    ),
                  );
                });
          },
        );
      default:
        return Container();
    }
  }

  Widget _selectingWidget(double height, double width) {
    return AnimatedContainer(
      duration: Duration(microseconds: 100),
      height: height,
      width: width,
      margin: EdgeInsets.only(right: 15),
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          color: _borderColor,
          dashPattern: [12, 6],
          strokeWidth: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(_radius), bottomRight: Radius.circular(_radius)),
            child: Container(
              color: _containerColor,
              child: GestureDetector(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, gradient: PRIMARY_GRADIENT),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Visibility(
                        maintainSize: _selectingWidgetleftPos > 15 ? true : false,
                        maintainAnimation: _selectingWidgetleftPos > 15 ? true : false,
                        maintainState: _selectingWidgetleftPos > 15 ? true : false,
                        visible: _selectingWidgetleftPos > 15 ? true : false,
                        child: Container(
                            margin: EdgeInsets.only(top: 7),
                            child: CustomTextWidget('Select Game',
                                isDynamic: false,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white.withOpacity(0.7)),
                                width: ScreenUtils.getDesignWidth(70))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Wait Hold Up"),
      content: Text("You've already added this game to your list"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showGameCapAlert(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Ah ah Ah"),
      content: Text("Can't add more than 3 games to a sale , sorry :)"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showBottomSheet({required int gameId}) {
    showModalBottomSheet<void>(
        isDismissible: true,
        context: context,
        builder: (_) {
          return ChangeNotifierProvider.value(
            value: Provider.of<CreateSaleModel>(context),
            builder: (context, _) {
              return UpdateGameBottomSheet(
                id: gameId,
              );
            },
          );
        });
  }
}
