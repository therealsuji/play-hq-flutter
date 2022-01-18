import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class CustomSmallerButton extends StatelessWidget {

  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final LinearGradient? gradient;
  final double textFontSize;

  CustomSmallerButton({this.onPressed , this.textFontSize = 10 , this.buttonText , this.buttonColor , this.gradient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ScreenUtils.getDesignWidth(110),
        height: ScreenUtils.getDesignHeight(40),
        decoration: BoxDecoration(
          gradient: gradient,
            borderRadius: BorderRadius.circular(3.0), color: buttonColor),
        child: Center(child: Text(buttonText! , style: TextStyle(fontFamily: CircularBook , color: Colors.white , fontSize: textFontSize),)),
      ),
    );
  }
}
