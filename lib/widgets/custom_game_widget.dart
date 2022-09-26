import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/helpers/app_utils.dart';
import 'package:skeletons/skeletons.dart';
import 'gradient_text_widget.dart';

class GamesWidget extends StatelessWidget {
  final String? backgroundUrl;
  final Color? color;
  final Gradient? gradient;
  final double? height;
  final double? width;

  final String? title;
  final String? subTitle;

  GamesWidget({
    this.backgroundUrl,
    this.color,
    this.height = 160,
    this.width = 100,
    this.gradient,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(width!),
      height: ScreenUtils.getDesignHeight(height!),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: ScreenUtils.getDesignWidth(width!),
                height: ScreenUtils.getDesignHeight(height!),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: backgroundUrl ??
                        'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg'),
              ),
            ),
            Positioned.fill(
              bottom: 0,
              child: Container(
                width: ScreenUtils.getDesignWidth(width!),
                height: ScreenUtils.getDesignHeight(height!),
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
                width: ScreenUtils.getDesignWidth(width!),
                padding: EdgeInsets.only(left: 9.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      title ?? "",
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
                      child: gradient == null
                          ? Text(
                              subTitle ?? "",
                              style: TextStyle(
                                fontFamily: Neusa,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            )
                          : GradientText(
                              subTitle ?? "",
                              gradient: gradient!,
                              style: Theme.of(context).primaryTextTheme.headline6!.copyWith(
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

class SkeletonGamesListWidget extends StatelessWidget {
  final double height;
  final double width;
  final count;
  const SkeletonGamesListWidget({Key? key, this.height = 160, this.width = 100, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, __) => SkeletonGamesWidget(height: height, width: width),
      separatorBuilder: (_, __) => SizedBox(
        width: ScreenUtils.getDesignHeight(15.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24),
      scrollDirection: Axis.horizontal,
      itemCount: count,
    );
  }
}

class SkeletonGamesWidget extends StatelessWidget {
  final double height;
  final double width;
  const SkeletonGamesWidget({Key? key, this.height = 160, this.width = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style: SkeletonLineStyle(height: height, width: width, borderRadius: BorderRadius.circular(8)),
    );
  }
}
