import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/cached_image_widget.dart';

class RecommendedGame extends StatelessWidget {
  final String imageUrl;
  final String name;
  RecommendedGame({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: ScreenUtils.getDesignWidth(220),
          height: ScreenUtils.getDesignHeight(290),
          child: Stack(
            children: [
              Positioned.fill(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: CachedImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              )),
              Positioned.fill(
                bottom: 0,
                child: Container(
                  width: ScreenUtils.getDesignWidth(220),
                  height: ScreenUtils.getDesignHeight(290),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    gradient: LinearGradient(
                      colors: [Color(0xff091015), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  width: ScreenUtils.getDesignWidth(150),
                  child: Text(
                    name,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
