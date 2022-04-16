import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

import 'gradient_text_widget.dart';

class GamesWidget extends StatelessWidget {
  final String? backgroundUrl;
  final String? gameName;
  final String? releaseDate;
  final Color? color;
  final Gradient? gradient;

  GamesWidget({
    this.gameName,
    this.releaseDate,
    this.backgroundUrl,
    this.color,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(99.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: ScreenUtils.getDesignWidth(105.0),
                height: ScreenUtils.getDesignHeight(160.0),
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
                width: ScreenUtils.getDesignWidth(105.0),
                height: ScreenUtils.getDesignHeight(160.0),
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
                width: ScreenUtils.getDesignWidth(105.0),
                padding: EdgeInsets.only(left: 9.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      gameName!,
                      isDynamic: true,
                      style: TextStyle(
                        fontFamily: CircularBook,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxWidth: ScreenUtils.getDesignWidth(70.0),
                      minWidth: ScreenUtils.getDesignWidth(30.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: color != null
                          ? Text(
                              releaseDate == null
                                  ? 'Not mentioned'
                                  : releaseDate!,
                              style: TextStyle(
                                fontFamily: Neusa,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            )
                          : GradientText(
                              releaseDate ?? "",
                              gradient: gradient!,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
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
