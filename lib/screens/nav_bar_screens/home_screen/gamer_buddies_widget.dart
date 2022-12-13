import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';

import '../../../widgets/custom_text_widget.dart';

class GamerBuddyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(156),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6)
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(90),
              width: ScreenUtils.getDesignWidth(90),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15),
                child: CustomTextWidget('Jason Sanders' , style: TextStyle(color: Colors.white , fontFamily: Neusa , fontWeight: FontWeight.w500 , fontSize: 18),)),
            CustomTextWidget('90% Match' , style: TextStyle(color: Colors.green , fontFamily: CircularBook , fontWeight: FontWeight.w700 , fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
