import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

class SingleActiveOrderWidget extends StatelessWidget {
  final String? gameName;
  final String? backgroundImage;
  final String? gamePrice;

  SingleActiveOrderWidget({
    Key? key,
    required this.gameName,
    required this.backgroundImage,
    required this.gamePrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: ScreenUtils.getDesignHeight(195),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: ScreenUtils.getDesignHeight(170),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(imageUrl: backgroundImage! , fit: BoxFit.cover,))),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: ScreenUtils.getDesignHeight(60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: MAIN_CONTAINER_COLOR,
              ),
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          gameName!,
                          isDynamic: true,
                          minWidth: ScreenUtils.getDesignWidth(30),
                          maxWidth: ScreenUtils.getDesignWidth(150),
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: Neusa,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        CustomTextWidget(
                          gamePrice!,
                          isDynamic: true,
                          minWidth: ScreenUtils.getDesignWidth(30),
                          maxWidth: ScreenUtils.getDesignWidth(150),
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: Neusa,
                              fontWeight: FontWeight.bold,
                              color: PRIMARY_COLOR),
                        ),
                      ],
                    ),
                    Spacer(),
                    _customButton(false, 'Order Details'),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: _customButton(true, 'Track Order'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _customButton(bool isImportant , String text) {
    return Center(
      child: Container(
        height: ScreenUtils.getDesignHeight(25),
        width: ScreenUtils.getDesignWidth(75),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          gradient: isImportant ? PRIMARY_GRADIENT : null,
          border: isImportant ? null : Border.all(color: PRIMARY_COLOR, width: 1),
        ),
        child: Center(
          child: CustomTextWidget(
            text,
            isDynamic: true,
            minWidth: ScreenUtils.getDesignWidth(30),
            maxWidth: ScreenUtils.getDesignWidth(150),
            style: TextStyle(
                fontSize: 8,
                fontFamily: CircularBook,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
