import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';


class CustomDottedSelectorWidget extends StatelessWidget {

  final VoidCallback onPressed;

  CustomDottedSelectorWidget({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          color: CONTAINER_COLOR,
          dashPattern: [10, 6],
          strokeWidth: 3,
          child: Container(
            width: ScreenUtils.getDesignWidth(100),
            color: Colors.transparent,
            child: GestureDetector(
              onTap: onPressed,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: PRIMARY_COLOR),
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
                            fontSize: 15,
                            fontFamily: CircularBook,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
