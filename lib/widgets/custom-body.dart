import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-assets.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomBody extends StatelessWidget {
  final List<Widget> body;
  final double paddingTop;
  final double paddingLeft;
  final double paddingBottom;
  final double paddingRight;

  CustomBody(
      {required this.body,
      this.paddingTop = 20.0,
      this.paddingLeft = 24.0,
      this.paddingRight = 24.0,
      this.paddingBottom = 45.0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            BACKGROUND_IMAGE,
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            width: ScreenUtils.bodyWidth,
            child: Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.statusBarHeight + ScreenUtils.getDesignHeight(paddingTop),
                left: ScreenUtils.getDesignWidth(paddingLeft),
                right: ScreenUtils.getDesignWidth(paddingRight),
                bottom: ScreenUtils.getDesignWidth(paddingBottom),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: body != null && body != [] ? body : [],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
