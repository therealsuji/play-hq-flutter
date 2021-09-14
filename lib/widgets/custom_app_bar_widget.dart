import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showNotificationIcon;
  final bool hasNotification;
  final double? paddingTop;

  @override
  final Size preferredSize = const Size(0, 0);

  CustomAppBarWidget(
      {required this.title, this.hasNotification = false, this.showNotificationIcon = true, this.paddingTop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: paddingTop ?? ScreenUtils.getDesignHeight(20), bottom: 15.0, left: 24.0, right: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 30.0,
                    width: 30.0,
                    padding: EdgeInsets.all(2.0),
                    child: SvgPicture.asset(
                      'assets/icons/back.svg',
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  title,
                  style: Theme.of(context).primaryTextTheme.headline2!.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
          if (showNotificationIcon)
            Stack(
              children: [
                SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      NOTIFICATION_ICON,
                      color: Colors.white,
                    )),
                if (hasNotification)
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: PRIMARY_COLOR),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
