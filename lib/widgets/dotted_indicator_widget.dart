import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class DottedIndicatorWidget extends StatelessWidget {

  final int currentPage;

  const DottedIndicatorWidget({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 4),
            height: ScreenUtils.getDesignHeight(10),
            width: currentPage == 0 ? ScreenUtils.getDesignWidth(25) : ScreenUtils.getDesignWidth(10),
            decoration: BoxDecoration(
                shape: currentPage == 0 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: currentPage == 0 ? BorderRadius.circular(100) : null,
                gradient: currentPage == 0 ? PRIMARY_GRADIENT : null,
                color: currentPage == 0 ? null : SUB_TEXT_COLOR
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4),
            height: ScreenUtils.getDesignHeight(10),
            width: currentPage == 1 ? ScreenUtils.getDesignWidth(25) : ScreenUtils.getDesignWidth(10),
            decoration: BoxDecoration(
                shape: currentPage == 1 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: currentPage == 1 ? BorderRadius.circular(100) : null,
                gradient: currentPage == 1 ? PRIMARY_GRADIENT : null,
                color: currentPage == 1 ? null : SUB_TEXT_COLOR
            ),
          ),Container(
            margin: EdgeInsets.only(right: 4),
            height: ScreenUtils.getDesignHeight(10),
            width: currentPage == 2 ? ScreenUtils.getDesignWidth(25) : ScreenUtils.getDesignWidth(10),
            decoration: BoxDecoration(
                shape: currentPage == 2 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: currentPage == 2 ? BorderRadius.circular(100) : null,
                gradient: currentPage == 2 ? PRIMARY_GRADIENT : null,
                color: currentPage == 2 ? null : SUB_TEXT_COLOR
            ),
          ),Container(
            height: ScreenUtils.getDesignHeight(10),
            width: currentPage == 3 ? ScreenUtils.getDesignWidth(25) : ScreenUtils.getDesignWidth(10),
            decoration: BoxDecoration(
                shape: currentPage == 3 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: currentPage == 3 ? BorderRadius.circular(100) : null,
                gradient: currentPage == 3 ? PRIMARY_GRADIENT : null,
                color: currentPage == 3 ? null : SUB_TEXT_COLOR
            ),
          ),
        ],
      ),
    );
  }
}
