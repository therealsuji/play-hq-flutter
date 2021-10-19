import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/profile/main_profile/main_profile_model.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class CustomGamePicker extends StatefulWidget {

  @override
  _CustomGamePickerState createState() => _CustomGamePickerState();
}

class _CustomGamePickerState extends State<CustomGamePicker> {

  ScrollController? _sliderController;
  double _selectingWidgetWidth = ScreenUtils.getDesignWidth(120);
  double _selectingWidgetHeight = ScreenUtils.getDesignHeight(170);
  double _selectingWidgetTopPos = 0;
  double _selectingWidgetleftPos = 24;
  Color _containerColor = Colors.transparent;
  Color _borderColor  = FILL_COLOR;
  double _radius = 5;
  double _margin = 0;

  @override
  void initState() {
    _sliderController = ScrollController();
    _sliderController!.addListener(_scroller);
    super.initState();
  }

  _scroller(){
    setState(() {
      var _t = (_sliderController!.position.pixels.clamp(0, 200) / 2) / 100;
      _selectingWidgetWidth = lerpDouble(ScreenUtils.getDesignWidth(120), ScreenUtils.getDesignWidth(70), _t)!;
      _selectingWidgetHeight = lerpDouble(ScreenUtils.getDesignHeight(170), ScreenUtils.getDesignHeight(65), _t)!;
      _selectingWidgetTopPos = lerpDouble(0, ScreenUtils.getDesignHeight(60), _t)!;
      _selectingWidgetleftPos = lerpDouble(24, 0, _t)!;
      _margin = lerpDouble(0, 24, _t)!;
      _containerColor = Color.lerp(Colors.transparent, BACKGROUND_COLOR, _t)!;
      _borderColor = Color.lerp(FILL_COLOR, Colors.transparent, _t*3)!;
      _radius = lerpDouble(5, 50, _t)!;
    });
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<MainProfileModel>(
        builder: (_ , val , __){
          return Padding(
            padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15) , bottom: 100),
            child: Stack(
              children: [
                Container(
                  height: ScreenUtils.getDesignHeight(170),
                  margin: EdgeInsets.only(left: _margin , right: 24),
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details){
                      print(details);
                    },
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: _sliderController,
                      padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(165)),
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: ScreenUtils.getDesignWidth(20)),
                          width: ScreenUtils.getDesignWidth(120),
                          height: ScreenUtils.getDesignHeight(170),
                          color: Colors.orange,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: ScreenUtils.getDesignWidth(20)),
                          width: ScreenUtils.getDesignWidth(120),
                          height: ScreenUtils.getDesignHeight(170),
                          color: Colors.orange,
                        ),
                        Container(
                          width: ScreenUtils.getDesignWidth(120),
                          height: ScreenUtils.getDesignHeight(170),
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: _selectingWidgetTopPos,
                    left: _selectingWidgetleftPos,
                    child: _selectingWidget(_selectingWidgetHeight , _selectingWidgetWidth))
              ],
            ),
          );
        },
    ));
  }

  Widget _selectingWidget(double height , double width){
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
            borderRadius: BorderRadius.only(topRight: Radius.circular(_radius) , bottomRight: Radius.circular(_radius)),
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
                        decoration: BoxDecoration(shape: BoxShape.circle, gradient: PRIMARY_GRADIENT),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      CustomTextWidget('Select Game', isDynamic: false)
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
