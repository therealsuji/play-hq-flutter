import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;

  CustomAppBarWidget({this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: ScreenUtils.getDesignHeight(52),bottom: 10),
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
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      'assets/icons/back.svg',
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  this.title,
                  style: Theme.of(context).primaryTextTheme.headline2.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
          Stack(
            children: [
              SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    'assets/icons/notification.svg',
                    color: Colors.white,
                  )),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
