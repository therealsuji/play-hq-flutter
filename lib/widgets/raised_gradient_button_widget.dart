import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class RaisedGradientButton extends StatelessWidget {

  final Gradient? gradient;
  final String? buttonText;
  final VoidCallback? onPressed;
  final double textFontSize;

  const RaisedGradientButton({
    Key? key,
    this.gradient,
    this.buttonText,
    this.onPressed,
    this.textFontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtils.getDesignHeight(45),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              buttonText!,
              style: TextStyle(
                color: Colors.white,
                fontFamily: Neusa,
                fontSize: textFontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
