import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class CustomBody extends StatelessWidget {
  final List<Widget> body;
  final double paddingTop;
  final double paddingLeft;
  final double paddingBottom;
  final double paddingRight;
  final bool getStatusBar;

  CustomBody({
    required this.body,
    this.paddingTop = 20.0,
    this.paddingLeft = 24.0,
    this.paddingRight = 24.0,
    this.paddingBottom = 45.0,
    this.getStatusBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BACKGROUND_COLOR,
      child: SingleChildScrollView(
        child: Container(
          width: ScreenUtils.bodyWidth,
          child: Padding(
            padding: EdgeInsets.only(
              top: (getStatusBar ? ScreenUtils.statusBarHeight : 0.0) + ScreenUtils.getDesignHeight(paddingTop),
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
    );
  }
}
