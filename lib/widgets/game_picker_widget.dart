import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/view_models/onboarding/setup_purchase_account_view_model/purchase_account_model.dart';
import 'package:play_hq/view_models/onboarding/setup_sales_account_view_model/sales-account-model.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

import 'game_picker_details_widget.dart';

class CustomGamePicker extends StatefulWidget {

  final GamePicker? gameType;

  CustomGamePicker({this.gameType});

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
      _selectingWidgetWidth = lerpDouble(
          ScreenUtils.getDesignWidth(120), ScreenUtils.getDesignWidth(70), _t)!;
      _selectingWidgetHeight = lerpDouble(ScreenUtils.getDesignHeight(170),
          ScreenUtils.getDesignHeight(65), _t)!;
      _selectingWidgetleftPos = lerpDouble(24, 0, _t)!;
      _margin = lerpDouble(0, 24, _t)!;
      _containerColor = Color.lerp(Colors.transparent, MAIN_CONTAINER_COLOR, _t)!;
      _borderColor = Color.lerp(FILL_COLOR, Colors.transparent, _t * 3)!;
      _radius = lerpDouble(5, 50, _t)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Padding(
      padding: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(15), bottom: 100),
      child: Stack(
        children: [
          Container(
            height: ScreenUtils.getDesignHeight(170),
            margin: EdgeInsets.only(left: _margin, right: 24),
            child: _getGameType(widget.gameType!),
          ),
          _searchGameType(widget.gameType!)
        ],
      ),
    ));
  }

  Widget _searchGameType(GamePicker game){
    switch (game){
      case GamePicker.PurchaseWishlist:
        return Positioned.fill(
          left: _selectingWidgetleftPos,
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () async {
                dynamic gameDetails = await Navigator.pushNamed(
                    context, MAIN_SEARCH_SCREEN,
                    arguments: SearchGameScreens.SetupPurchase);
                if (gameDetails != null) {
                  Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                      .addSelectedGame(gameDetails);
                }
              },
              child: _selectingWidget(
                  _selectingWidgetHeight, _selectingWidgetWidth),
            ),
          ),
        );
      case GamePicker.SalesLibrary:
        return Positioned.fill(
          left: _selectingWidgetleftPos,
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () async {
                dynamic gameDetails = await Navigator.pushNamed(
                    context, MAIN_SEARCH_SCREEN,
                    arguments: SearchGameScreens.SetupSales);
                if (gameDetails != null) {
                  Provider.of<SetupSalesModel>(context, listen: false)
                      .addSelectedGame(gameDetails);
                }
              },
              child: _selectingWidget(
                  _selectingWidgetHeight, _selectingWidgetWidth),
            ),
          ),
        );
      default:
        return Container();
    }
  }

  Widget _getGameType(GamePicker game){
    switch (game){
      case GamePicker.PurchaseWishlist :
        return ChangeNotifierProvider.value(
          value: Provider.of<SetupPurchaseAccountModel>(context),
          child: Consumer<SetupPurchaseAccountModel>(
            builder: (_ , val , __){
              return Container(
                child: Consumer<SetupPurchaseAccountModel>(
                  builder: (_ , values , __){
                    return ListView.separated(
                      separatorBuilder: (BuildContext context , int index){
                        return SizedBox(width: ScreenUtils.getDesignWidth(15));
                      },
                        padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(160)),
                        controller: _sliderController,
                        itemCount: values.selectedGameList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context , int index){
                          return GamePickerGames(
                            backgroundUrl: values.selectedGameList[index].boxCover,
                            gameName: values.selectedGameList[index].title,
                            releaseDate: values.selectedGameList[index].releaseDate,
                          );
                        });
                  },
                ),
                );
            },
          ),
        );
      case GamePicker.SalesLibrary:
        return ChangeNotifierProvider.value(
          value: Provider.of<SetupSalesModel>(context),
          child: Consumer<SetupSalesModel>(
            builder: (_ , val , __){
              return Container(
                child: Consumer<SetupSalesModel>(
                  builder: (_ , values , __){
                    return ListView.separated(
                        separatorBuilder: (BuildContext context , int index){
                          return SizedBox(width: ScreenUtils.getDesignWidth(15));
                        },
                        padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(160)),
                        controller: _sliderController,
                        itemCount: values.selectedGameList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context , int index){
                          return GamePickerGames(
                            backgroundUrl: values.selectedGameList[index].boxCover,
                            gameName: values.selectedGameList[index].title,
                            releaseDate: values.selectedGameList[index].releaseDate,
                          );
                        });
                  },
                ),
              );
            },
          ),
        );
      default :
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
                topRight: Radius.circular(_radius),
                bottomRight: Radius.circular(_radius)),
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
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, gradient: PRIMARY_GRADIENT),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Visibility(
                        maintainSize:
                            _selectingWidgetleftPos > 15 ? true : false,
                        maintainAnimation:
                            _selectingWidgetleftPos > 15 ? true : false,
                        maintainState:
                            _selectingWidgetleftPos > 15 ? true : false,
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
}