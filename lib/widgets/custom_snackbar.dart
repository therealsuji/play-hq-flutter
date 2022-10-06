import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_screen_utils.dart';
import '../models/errors/exceptions.dart';

abstract class DisplayError {
  void showError(BuildContext context, Failure exception, [Icon? icon, VoidCallback? onRetry]);
  // void showNotification(BuildContext context, {String? title="", String body=""});
}

class DisplayImpl extends DisplayError {
  @override
  void showError(BuildContext context, Failure exception, [Icon? icon, VoidCallback? onRetry]) {
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

  // @override
  // void showNotification(BuildContext context, {String? title="", String body=""}) {
  //   final Flushbar _flushBar = Flushbar(
  //     flushbarPosition: FlushbarPosition.TOP,
  //     flushbarStyle: FlushbarStyle.FLOATING,
  //     reverseAnimationCurve: Curves.decelerate,
  //     forwardAnimationCurve: Curves.elasticOut,
  //     margin: const EdgeInsets.symmetric(horizontal: 12.0),
  //     padding: const EdgeInsets.all(17.0),
  //     borderRadius: BorderRadius.circular(9.0),
  //     boxShadows: [
  //       const BoxShadow(
  //         color: Color(0xFFCCDDFF),
  //         offset: Offset(0.0, 3.0),
  //         blurRadius: 6.0,
  //       ),
  //     ],
  //     isDismissible: true,
  //     duration: Duration(seconds: 3),
  //     backgroundColor: Colors.white,
  //     barBlur: 2.0,
  //     messageText: Row(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(right: 12.0),
  //           child: SvgPicture.asset(
  //             LOGO3,
  //             width: 33,
  //           ),
  //         ),
  //         Expanded(
  //           child: RichText(
  //             text: TextSpan(
  //               text: title!,
  //               style: const TextStyle(
  //                 color: TEXT_PRIMARY,
  //                 fontSize: 14.0,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //               children: <TextSpan>[
  //                 TextSpan(
  //                   text: ' $body',
  //                   style: const TextStyle(
  //                     color: TEXT_PRIMARY,
  //                     fontSize: 14.0,
  //                     fontWeight: FontWeight.normal,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  //
  //   _flushBar.show(context);
  // }
}
