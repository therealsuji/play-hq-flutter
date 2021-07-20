import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-constants.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class SelectGameItem extends StatelessWidget {
  final String imageURL;
  final String titleText;
  final bool isSelected;
  final bool isDismisable;
  final VoidCallback dismissPressed;

  SelectGameItem({this.imageURL, this.titleText, this.isSelected, this.isDismisable = false, this.dismissPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(102),
      height: ScreenUtils.getDesignHeight(130),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: isSelected ? Border.all(color: PRIMARY_COLOR, width: 2) : Border.all(width: 0)),
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
              imageUrl: imageURL,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: isSelected ? PRIMARY_COLOR.withOpacity(0.6) : BACKGROUND_COLOR.withOpacity(0.7),
                borderRadius: BorderRadius.circular(5.0)),
          ),
          if (isDismisable) ...[
            GestureDetector(
              onTap: dismissPressed,
              child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      'assets/icons/x-circle.svg',
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
          Center(
            child: Text(
              titleText,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: Neusa, fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
