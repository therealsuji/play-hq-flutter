import 'package:flutter/material.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;


  CustomButton({this.buttonText,this.onPressed,this.buttonColor = Primary});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtils.getDesignHeight(45),
      child: RaisedButton(
        elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0), side: BorderSide(color: buttonColor)),
          color: buttonColor,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontFamily: Neusa, fontSize: 18),
          ),
          onPressed: onPressed ?? () {},
      ),
    );
  }
}
