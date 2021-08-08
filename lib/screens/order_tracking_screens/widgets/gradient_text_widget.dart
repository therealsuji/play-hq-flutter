import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {

  final String text;
  final Gradient gradient;
  final TextStyle? style;
  final TextAlign? textAlign;

  GradientText({
    required this.text,
    required this.gradient,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style ?? Theme.of(context).primaryTextTheme.headline1,
        textAlign: textAlign ?? TextAlign.center,
      ),
    );
  }
}