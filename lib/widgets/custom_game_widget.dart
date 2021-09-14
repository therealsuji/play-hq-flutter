import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

import 'gradient_text_widget.dart';

class GamesWidget extends StatelessWidget {
  final String? backgroundUrl;
  final String? gameName;
  final String? releaseDate;
  final Color? color;
  final Gradient? gradient;

  //for local testing
  GamesWidget({this.gameName, this.releaseDate, this.backgroundUrl , this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(105),
      height: ScreenUtils.getDesignHeight(160),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: Stack(
          children: [
            Positioned.fill(
               child: Container(
                width: ScreenUtils.getDesignWidth(105),
                height: ScreenUtils.getDesignHeight(160),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          backgroundUrl!,
                        ))),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenUtils.getDesignWidth(105),
                height: ScreenUtils.getDesignHeight(160),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff091015), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenUtils.getDesignWidth(105),
                padding: EdgeInsets.only(left: 9, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gameName!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: CircularBook,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: color != null ? Text(
                          releaseDate == null ? 'Not mentioned' : releaseDate!,
                          style: TextStyle(fontFamily: Neusa, fontSize: 12, fontWeight: FontWeight.bold, color: color),
                        ) : GradientText(
                          text: releaseDate ?? "",
                          gradient: gradient!,
                          style: Theme.of(context).primaryTextTheme.headline6!.copyWith(color: Colors.white),
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