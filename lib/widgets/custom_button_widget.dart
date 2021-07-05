import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;
  final double textFontSize;

  CustomButton(
      {this.buttonText,
      this.onPressed,
      this.buttonColor,
      this.textFontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
        child: Container(
          width: double.infinity,
          height: ScreenUtils.getDesignHeight(45),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: buttonColor),
          child: Center(child: Text(buttonText , style: TextStyle(fontFamily: CircularBold , color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18),)),
        )

    );
  }
}
