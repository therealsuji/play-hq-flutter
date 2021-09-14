import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class CustomAlertButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final double textFontSize;

  CustomAlertButton(
      {this.buttonText,
        this.onPressed,
        this.buttonColor,
        this.textFontSize = 16});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ScreenUtils.getDesignWidth(125),
        height: ScreenUtils.getDesignHeight(35),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: buttonColor),
        child: Center(child: Text(buttonText! , style: TextStyle(fontFamily: CircularBook , color: Colors.white , fontWeight: FontWeight.bold , fontSize: textFontSize),)),
      ),
    );
  }
}
