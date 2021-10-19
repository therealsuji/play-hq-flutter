import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? maxWidth;
  final double? minWidth;
  final TextStyle? style;
  final String text;
  final bool isDynamic;
  final TextAlign? align;

  CustomTextWidget(
  this.text,
      {this.height,
      this.width,
      this.style,
      this.maxWidth,
      this.minWidth,
      required this.isDynamic,
      this.align});

  @override
  Widget build(BuildContext context) {
    return isDynamic
        ? FittedBox(
            fit: BoxFit.fill,
            child: Container(
              child: Text(text, style: style),
              constraints:
                  BoxConstraints(maxWidth: maxWidth!, minWidth: minWidth!),
            ),
          )
        : Container(
            height: height,
            width: width,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                text,
                style: style,
                textAlign: align == null ? TextAlign.start : align,
              ),
            ),
          );
  }
}
