import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomExpanderWidget extends StatelessWidget {
  final double? height;
  final Widget? widget;
  final IconData? iconData;
  final String? titleText;
  final String? selectedText;
  final VoidCallback? onTap;
  final bool? state;

  CustomExpanderWidget(
      {this.height, this.iconData, this.widget, this.titleText, this.state, this.selectedText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.bodyWidth,
      height: height,
      decoration: BoxDecoration(
        color: CONTAINER_COLOR.withOpacity(0.6),
      ),
      margin: EdgeInsets.only(top: 35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0 , left: 24.0 , right: 24.0),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Container(
                    child: Text(
                      titleText!,
                      style: Theme.of(context).primaryTextTheme.headline3
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: Text(
                      selectedText!,
                      style: TextStyle(
                        fontFamily: CircularBold,
                        foreground: Paint()..shader = textPrimaryGradient,
                        fontSize: 12
                      )
                    ),
                  ),
                  Container(
                      height: 25.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, gradient: PRIMARY_GRADIENT),
                      child: Icon(
                        iconData,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
          Visibility(
            maintainSize: state!,
            maintainState: state!,
            visible: state!,
            maintainAnimation: state!,
            child: Padding(
              padding: EdgeInsets.only(top: 15.0, left: 24.0),
              child: widget,
            ),
          )
        ],
      ),
    );
  }
}
