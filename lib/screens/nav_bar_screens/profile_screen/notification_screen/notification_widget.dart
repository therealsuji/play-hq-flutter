import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class NotificationWidget extends StatelessWidget {
  final Color notificationColor;
  final String iconPath;

  NotificationWidget({required this.notificationColor , required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(60),
      width: double.infinity,
      decoration: BoxDecoration(
        color: notificationColor.withOpacity(0.1),
        border: Border.all(color: notificationColor , width: 1.5),
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.only(right: 5, top: 5),
            decoration: BoxDecoration(
              color: notificationColor,
              shape: BoxShape.circle
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(15), right: ScreenUtils.getDesignWidth(15)),
            child: Row(
              children: [
                Container(
                  height: ScreenUtils.getDesignHeight(30),
                  width: ScreenUtils.getDesignWidth(30),
                  decoration: BoxDecoration(
                    color: notificationColor,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Container(
                    child: SvgPicture.asset(
                      iconPath,
                      fit: BoxFit.scaleDown,
                      height: 10,
                      width: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(15)),
                  child: Text(
                    "This is a test notification",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
