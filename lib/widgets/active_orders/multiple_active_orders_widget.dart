import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

import '../custom_button_widget.dart';
import '../gradient_text_widget.dart';

class MultipleActiveOrderWidget extends StatelessWidget {
  const MultipleActiveOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtils.getDesignHeight(15.0),
        horizontal: ScreenUtils.getDesignWidth(24.0),
      ),
      height: ScreenUtils.getDesignHeight(222.0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtils.getDesignHeight(15.0),
              left: ScreenUtils.getDesignWidth(12.0),
              right: ScreenUtils.getDesignWidth(12.0),
            ),
            height: ScreenUtils.getDesignHeight(198.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: MAIN_CONTAINER_COLOR,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtils.getDesignWidth(92.0),
                  height: ScreenUtils.getDesignHeight(127.0),
                  color: Colors.amber,
                ),
                Container(
                  width: ScreenUtils.getDesignWidth(92.0),
                  height: ScreenUtils.getDesignHeight(127.0),
                  color: Colors.amber,
                ),
                Container(
                  width: ScreenUtils.getDesignWidth(92.0),
                  height: ScreenUtils.getDesignHeight(127.0),
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          Positioned(
            left: ScreenUtils.getDesignWidth(12.0),
            right: ScreenUtils.getDesignWidth(12.0),
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtils.getDesignWidth(10.0),
              ),
              height: ScreenUtils.getDesignHeight(65.0),
              decoration: BoxDecoration(
                color: MAIN_CONTAINER_COLOR,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: SUB_TEXT_COLOR.withOpacity(0.6),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bundle Price",
                        style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                          fontSize: 10.0,
                        ),
                      ),
                      GradientText(
                        "5200.00 LKR",
                        gradient: GREEN_GRADIENT,
                        style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: ScreenUtils.getDesignWidth(24.0),
                        ),
                        color: SUB_TEXT_COLOR.withOpacity(0.4),
                        height: ScreenUtils.getDesignHeight(41.0),
                        width: ScreenUtils.getDesignWidth(1.0),
                      ),
                      CustomButton(
                        height: ScreenUtils.getDesignHeight(33.0),
                        width: ScreenUtils.getDesignWidth(94.0),
                        buttonText: "View Deal",
                        gradient: PRIMARY_GRADIENT,
                        textFontSize: 10.0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
