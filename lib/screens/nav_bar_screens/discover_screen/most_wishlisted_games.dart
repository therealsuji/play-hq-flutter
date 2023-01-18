import 'package:flutter/material.dart';

import '../../../helpers/app_screen_utils.dart';
import '../../../widgets/cached_image_widget.dart';
import '../../../widgets/custom_text_widget.dart';

class MostWishlistedGames extends StatelessWidget {
  const MostWishlistedGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(250),
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedImage(
                imageUrl:
                "https://thetomorrowtechnology.co.ke/wp-content/uploads/2020/08/date-sortie-ghost-of-tsushima-ps4-1200x900-1-1.jpg",
                fit: BoxFit.cover),
          ),
          Positioned.fill(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.9)
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget('Ghost of Tsushima' , isDynamic: true, maxWidth: ScreenUtils.getDesignWidth(ScreenUtils.bodyWidth/2),minWidth: 30, style: Theme.of(context).primaryTextTheme.headline1,),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
