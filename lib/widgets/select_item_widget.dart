import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class SelectItem extends StatelessWidget {
  final String? imageURL;
  final String? titleText;
  final bool? isSelected;
  const SelectItem({Key? key, this.imageURL, this.titleText, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(102),
      height: ScreenUtils.getDesignHeight(130),
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
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isSelected! ? PRIMARY_COLOR.withOpacity(0.6) : BACKGROUND_COLOR.withOpacity(0.7),
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          Center(
            child: Container(
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  titleText!,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline2
                      ?.copyWith(color: Colors.white, fontFamily: Neusa, fontSize: 18),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: ScreenUtils.getDesignWidth(80),
                minWidth: ScreenUtils.getDesignHeight(30)
              ),
            ),
          )
        ],
      ),
    );
  }
}
