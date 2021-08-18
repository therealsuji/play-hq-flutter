import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {

  final double? height;
  final double? width;
  final TextStyle? style;
  final String? text;

  CustomTextWidget({this.height , this.width , this.style , this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
            text!,
            style: style
        ),
      ),
    );
  }
}
