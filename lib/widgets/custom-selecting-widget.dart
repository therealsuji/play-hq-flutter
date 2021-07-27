import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomSelectingWidget extends StatelessWidget {

  final String? titleText;
  final bool? active;

  CustomSelectingWidget({this.titleText , this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(35),
      width: ScreenUtils.getDesignWidth(102),
      decoration: BoxDecoration(
        color: active! ? PRIMARY_COLOR : UNSELECTED_ITEM_COLOR,
        borderRadius: BorderRadius.circular(3.0)
      ),
      child: Center(
        child: Text(titleText! , style: TextStyle(fontSize: 14 , fontFamily: CircularBook , color: Colors.white , fontWeight: FontWeight.w500),),
      ),
    );
  }
}
