import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class CustomSelectingWidget extends StatelessWidget {

  final String? titleText;
  final bool? active;

  CustomSelectingWidget({this.titleText , this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(45),
      width: ScreenUtils.getDesignWidth(100),
      decoration: BoxDecoration(
        gradient: active! ? PRIMARY_GRADIENT : LinearGradient(colors: [UNSELECTED_CONTAINER_COLOR.withOpacity(0.6), UNSELECTED_CONTAINER_COLOR.withOpacity(0.6)]),
        borderRadius: BorderRadius.circular(3.0)
      ),
      child: Center(
        child: Text(titleText! , style: TextStyle(fontSize: 12 , fontFamily: CircularBook , color: Colors.white , fontWeight: FontWeight.w500),),
      ),
    );
  }
}
