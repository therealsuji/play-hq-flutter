import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../helpers/app_colors.dart';
import '../../helpers/app_screen_utils.dart';
import '../../models/errors/exceptions.dart';

abstract class DisplayError {
  void showResponse(BuildContext context, Message exception, [Icon? icon, VoidCallback? onRetry]);
  // void showNotification(BuildContext context, {String? title="", String body=""});
}

class DisplayImpl extends DisplayError {
  @override
  void showResponse(BuildContext context, Message exception, [Icon? icon, VoidCallback? onRetry]) {
    final Flushbar _flushBar = Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtils.getDesignWidth(28),
        vertical: ScreenUtils.getDesignHeight(34),
      ),
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtils.getDesignHeight(16),
        horizontal: ScreenUtils.getDesignWidth(14),
      ),
      borderRadius: BorderRadius.circular(6),
      boxShadows: [
        BoxShadow(
          color: POP_UP_CONTAINER_COLOR,
          offset: Offset(0.0, 3.0),
          blurRadius: 6.0,
        ),
      ],
      isDismissible: true,
      backgroundColor: POP_UP_CONTAINER_COLOR,
      duration: exception.duration,
      mainButton: exception.onTap != null
          ? TextButton(
              onPressed: () {
                Navigator.pop(context);
                exception.onTap!();
              },
              child: Text(
                "Try Again",
                style: const TextStyle(
                  color: Color(0xFFFFA73B),
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Icon(
              Icons.error_outline_rounded,
              color: Colors.amberAccent,
            ),
          ),
          Expanded(
            child: Text(
              exception.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    _flushBar.show(context);
  }
}
