import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/active_game_sale_widget.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_game_sale_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class GamesForSaleScreen extends StatefulWidget {
  @override
  _GamesForSaleScreenState createState() => _GamesForSaleScreenState();
}

class _GamesForSaleScreenState extends State<GamesForSaleScreen> {
  List<int> list = new List(25);
  List<int> list2 = new List(25);
  ScrollController _activeSlideController;
  double _createSaleOpacity = 1;
  double _createSaleContainerPos = ScreenUtils.getDesignWidth(20);
  double _createSaleContainerTopPos = 0;
  double _createSaleContainerWidth = ScreenUtils.getDesignWidth(150);
  double _createSaleContainerHeight = ScreenUtils.getDesignHeight(195);
  Color _createSaleContainerColor = Background;
  Color _createSaleContainerBorder = Color(0xff949AAE);
  bool labelVisible = true;

  @override
  void initState() {
    _activeSlideController = ScrollController();
    _activeSlideController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    setState(() {
      var _t = (_activeSlideController.position.pixels.clamp(0, 200) / 2) / 100;
      _createSaleContainerPos = lerpDouble(20, 0, _t);
      _createSaleOpacity = lerpDouble(1, 0, _t);
      _createSaleContainerColor = Color.lerp(Background, Primary, _t);
      _createSaleContainerBorder = Color.lerp(Color(0xff949AAE), Colors.transparent, _t);
      _createSaleContainerWidth = lerpDouble(ScreenUtils.getDesignWidth(150), ScreenUtils.getDesignWidth(50), _t);
      _createSaleContainerHeight = lerpDouble(ScreenUtils.getDesignHeight(195), ScreenUtils.getDesignHeight(80), _t);
      _createSaleContainerTopPos = lerpDouble(0, ScreenUtils.getDesignHeight(50), _t);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBarWidget(
            title: "Your Games for sale",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text("Active Sales",
                    style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(color: Colors.white)),
              ),
              Stack(
                children: [
                  Container(
                    height: ScreenUtils.getDesignHeight(200),
                    child: ListView(
                        padding: EdgeInsets.only(left: 210),
                        controller: _activeSlideController,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: list.asMap().entries.map((entry) {
                          return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ActiveGameSaleWidget(
                              gameName: "GTA 5",
                              price: '3000',
                              backgroundUrl: "assets/images/cyber.png",
                              impressions: '100',
                              impressionsUp: "12",
                              location: "Colombo",
                              messages: "7",
                            ),
                          );
                        }).toList()),
                  ),
                  Positioned(
                      left: ScreenUtils.getDesignWidth(_createSaleContainerPos),
                      top: _createSaleContainerTopPos,
                      child: Center(
                        child: GestureDetector(
                          onTap: (){print('something');},
                          child: DottedBorder(
                              strokeWidth: 2,
                              radius: Radius.circular(6),
                              color: _createSaleContainerBorder,
                              borderType: BorderType.RRect,
                              dashPattern: [10],padding: EdgeInsets.all(0),
                              child: Container(
                                height: _createSaleContainerHeight,
                                width: _createSaleContainerWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight: Radius.circular(6)), color: _createSaleContainerColor),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: ScreenUtils.getDesignWidth(46),
                                        height: ScreenUtils.getDesignWidth(46),
                                        padding: EdgeInsets.all(15),
                                        decoration:
                                            BoxDecoration(borderRadius: BorderRadius.circular(50), color: Primary),
                                        child: SvgPicture.asset('assets/icons/plus.svg'),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Opacity(
                                        opacity: _createSaleOpacity,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 80),
                                          child: Text(
                                            'Create Sale',
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .subtitle1
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ))
                ],
              ),
              StickyHeader(
                header: Container(
                  color: Background,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text("Completed Sales",
                      style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(color: Colors.white)),
                ),
                content: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      children: list.asMap().entries.map((entry) {
                    int idx = entry.key;
                    return CustomGameSaleWidget(
                      title: "Fallout 4",
                      price: "4000",
                      soldTo: "Jake",
                      backgroundImage: "assets/images/tshushima.jpg",
                    );
                  }).toList()),
                ),
              )
            ],
          ),
        ));
  }
}
