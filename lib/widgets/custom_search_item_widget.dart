import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class SearchGameItem extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? releaseDate;

  SearchGameItem({this.title, this.releaseDate, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(81),
              width: ScreenUtils.getDesignWidth(60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl ?? 'https://storiavoce.com/wp-content/plugins/lightbox/images/No-image-found.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Container(
                      width: ScreenUtils.getDesignWidth(180),
                      child: Text(
                        title!,
                        style: TextStyle(
                            fontSize: 18, fontFamily: Neusa, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      constraints: BoxConstraints(
                          maxWidth: ScreenUtils.getDesignWidth(180), minWidth: ScreenUtils.getDesignHeight(50)),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Container(
                      child: Text(
                        releaseDate == null ? 'Not Mentioned' : releaseDate!,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: Neusa,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR),
                      ),
                      constraints: BoxConstraints(
                          maxWidth: ScreenUtils.getDesignWidth(180), minWidth: ScreenUtils.getDesignHeight(50)),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: ScreenUtils.getDesignHeight(20),
              width: ScreenUtils.getDesignWidth(20),
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: PRIMARY_GRADIENT),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
