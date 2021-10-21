import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

import 'gradient_text_widget.dart';

class GamePickerGames extends StatelessWidget {

  final String? backgroundUrl;
  final String? gameName;
  final String? releaseDate;
  final Color? color;
  final Gradient? gradient;

  GamePickerGames({
    this.gameName,
    this.releaseDate,
    this.backgroundUrl,
    this.color,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(120.0),
      height: ScreenUtils.getDesignHeight(170.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: ScreenUtils.getDesignWidth(120.0),
                height: ScreenUtils.getDesignHeight(170.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      backgroundUrl!,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenUtils.getDesignWidth(120.0),
                height: ScreenUtils.getDesignHeight(170.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff091015), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: ScreenUtils.getDesignWidth(120.0),
                padding: EdgeInsets.only(left: 9.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(gameName!, isDynamic: true ,
                    maxWidth: ScreenUtils.getDesignWidth(100),
                      minWidth: ScreenUtils.getDesignWidth(30),
                      style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700 , fontSize: 12 , fontFamily: CircularBook),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: CustomTextWidget(releaseDate!, isDynamic: true ,
                        maxWidth: ScreenUtils.getDesignWidth(100),
                        minWidth: ScreenUtils.getDesignWidth(30),
                        style: TextStyle(color: FILL_COLOR , fontWeight: FontWeight.bold , fontSize: 12 , fontFamily: Neusa),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
