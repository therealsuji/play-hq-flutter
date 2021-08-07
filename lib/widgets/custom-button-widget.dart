import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final LinearGradient? gradient;
  final VoidCallback? onPressed;
  final double textFontSize;

  CustomButton({this.buttonText, this.onPressed, this.buttonColor, this.textFontSize = 18, this.gradient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: ScreenUtils.getDesignHeight(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: buttonColor,
          gradient: gradient,
        ),
        child: Center(
            child: Text(
          buttonText!,
          style: TextStyle(fontFamily: Neusa, color: Colors.white, fontWeight: FontWeight.bold, fontSize: textFontSize),
        )),
      ),
    );
  }
}
