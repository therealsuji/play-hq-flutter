import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class CustomDottedSelectorWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool filled;

  CustomDottedSelectorWidget({this.onPressed, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          color: filled ? Colors.transparent : MAIN_CONTAINER_COLOR,
          dashPattern: [10, 6],
          strokeWidth: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            child: Container(
              width: ScreenUtils.getDesignWidth(100),
              color: filled ? MAIN_CONTAINER_COLOR : Colors.transparent,
              child: GestureDetector(
                onTap: onPressed,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(shape: BoxShape.circle, gradient: PRIMARY_GRADIENT),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Select Game',
                          style: TextStyle(
                              fontSize: 15, fontFamily: CircularBook, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
