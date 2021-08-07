import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class SelectGameItem extends StatelessWidget {
  final String? imageURL;
  final String? titleText;
  final String? centerText;
  final bool? isSelected;
  final String subtitleText;
  final bool isPrice;

  SelectGameItem({
    this.imageURL,
    this.titleText,
    this.isSelected = false,
    this.subtitleText = "",
    this.isPrice = false,
    this.centerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(100),
      height: ScreenUtils.getDesignHeight(138),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: isSelected! ? Border.all(color: PRIMARY_COLOR, width: 2) : Border.all(width: 0),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: CachedNetworkImage(
              height: ScreenUtils.totalBodyHeight,
              width: ScreenUtils.bodyWidth,
              placeholder: (context, url) => Center(
                child: Container(height: 50, width: 50, child: CircularProgressIndicator()),
              ),
              imageUrl: imageURL!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
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
          ),
          Container(
            decoration: BoxDecoration(
              color: isSelected! ? PRIMARY_COLOR.withOpacity(0.6) : Colors.transparent,
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
          ...[
            if (centerText != null)
              Center(
                child: Text(
                  centerText!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: Neusa,
                    fontSize: ScreenUtils.getDesignWidth(12.0),
                  ),
                ),
              ),
          ],
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtils.getDesignWidth(11.0),
              vertical: ScreenUtils.getDesignWidth(11.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: CircularBold,
                    fontSize: ScreenUtils.getDesignWidth(9.0),
                  ),
                ),
                ...[
                  if (subtitleText != "")
                    Text(
                      subtitleText,
                      style: TextStyle(
                        color: isPrice ? LIME_COLOR : PRIMARY_COLOR,
                        fontFamily: Neusa,
                        fontSize: ScreenUtils.getDesignWidth(9.0),
                      ),
                    )
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
