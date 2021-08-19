import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/widgets/custom-text-widget.dart';

class CustomExpanderWidget extends StatelessWidget {
  final double? height;
  final Widget? widget;
  final double? textWidth;
  final IconData? iconData;
  final String? titleText;
  final String? selectedText;
  final VoidCallback? onTap;
  final bool? state;

  CustomExpanderWidget(
      {this.height, this.iconData, this.widget, this.titleText, this.state, this.selectedText, this.onTap , this.textWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.bodyWidth,
      height: height,
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
      ),
      margin: EdgeInsets.only(top: 35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0 , left: 24.0 , right: 24.0 , bottom: state! ? 0.0 : 24.0),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  CustomTextWidget(text: titleText, style: Theme.of(context).primaryTextTheme.headline3, width: textWidth, height: ScreenUtils.getDesignHeight(20),),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: CustomTextWidget(text: selectedText!,style: TextStyle(
                        fontFamily: CircularBold,
                        foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                        fontSize: 10
                    ),
                      height: ScreenUtils.getDesignHeight(13),
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
              padding: EdgeInsets.only(top: 15.0, left: 24.0 , right: 24.0 , bottom: 20.0),
              child: widget,
            ),
          )
        ],
      ),
    );
  }
}
