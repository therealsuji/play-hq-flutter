import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';

class SectionLabel extends StatelessWidget {
  final String title;
  final String? rightText;
  final Function()? onClick;

  const SectionLabel({Key? key, required this.title, this.rightText, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtils.getDesignHeight(30.0),
        left: ScreenUtils.getDesignWidth(24.0),
        right: ScreenUtils.getDesignWidth(24.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
          ...[
            if (rightText != null)
              GestureDetector(
                onTap: () => {
                  if (onClick != null) {onClick!()}
                },
                child: GradientText(
                  rightText ?? "",
                  gradient: PRIMARY_GRADIENT,
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ),
          ]
        ],
      ),
    );
  }
}
