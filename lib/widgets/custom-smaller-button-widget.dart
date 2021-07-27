import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomSmallerButton extends StatelessWidget {

  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final double textFontSize;

  CustomSmallerButton({this.onPressed , this.textFontSize = 13 , this.buttonText , this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ScreenUtils.getDesignWidth(90),
        height: ScreenUtils.getDesignHeight(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0), color: buttonColor),
        child: Center(child: Text(buttonText! , style: TextStyle(fontFamily: Neusa , color: Colors.white , fontSize: textFontSize),)),
      ),
    );
  }
}
