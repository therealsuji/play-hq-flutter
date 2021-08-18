import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final LinearGradient? gradient;
  final VoidCallback? onPressed;
  final double? textFontSize;
  final double? height;
  final double? width;

  CustomButton({
    required this.buttonText,
    this.onPressed,
    this.buttonColor,
    this.textFontSize = 14,
    this.gradient,
    this.width = double.infinity,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: buttonColor,
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(4, 4),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0.0),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          buttonText,
          style: Theme.of(context).primaryTextTheme.button!.copyWith(
                fontSize: textFontSize,
              ),
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
