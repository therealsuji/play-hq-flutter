import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/helpers/app_utils.dart';
import 'gradient_text_widget.dart';

class GamesWidget extends StatelessWidget {
  final String? backgroundUrl;
  final String? gameName;
  final String? releaseDate;
  final String? price;
  final Color? color;
  final Gradient? gradient;
  final double? height;
  final double? width;

  GamesWidget({
    this.gameName,
    this.releaseDate,
    this.backgroundUrl,
    this.color,
    this.height = 160,
    this.width = 100,
    this.price,
    this.gradient,
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      backgroundUrl ??
                          'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
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
                    // Container(
                    //   margin: EdgeInsets.only(top: 5.0),
                    //   child: color != null
                    //       ? Text(
                    //           releaseDate == null
                    //               ? price == null
                    //                   ? 'Not mentioned'
                    //                   : price!
                    //               : DateTime.parse(releaseDate!).format('dd-MM-yyyy'),
                    //           style: TextStyle(
                    //             fontFamily: Neusa,
                    //             fontSize: 12.0,
                    //             fontWeight: FontWeight.bold,
                    //             color: color,
                    //           ),
                    //         )
                    //       : GradientText(
                    //           releaseDate == null
                    //               ? price == null
                    //                   ? 'Not mentioned'
                    //                   : price!
                    //               : DateTime.parse(releaseDate!).format('dd-MM-yyyy'),
                    //           gradient: gradient!,
                    //           style: Theme.of(context).primaryTextTheme.headline6!.copyWith(
                    //                 color: Colors.white,
                    //               ),
                    //         ),
                    // ),
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
