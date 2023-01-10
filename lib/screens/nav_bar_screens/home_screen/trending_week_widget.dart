import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

import '../../../helpers/app_screen_utils.dart';
import '../../../widgets/cached_image_widget.dart';

class TrendingThisWeekWidget extends StatelessWidget {
  const TrendingThisWeekWidget({Key? key}) : super(key: key);

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
                        _genreWidget('Action'),
                        _genreWidget('Adventure')
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
  
  Widget _genreWidget(String name){
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: ScreenUtils.getDesignHeight(35),
      width: ScreenUtils.getDesignWidth(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        border: Border.all(color: PRIMARY_COLOR)
      ),
      child: Center(
        child: Text(name , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
      ),
    );
  }
}
