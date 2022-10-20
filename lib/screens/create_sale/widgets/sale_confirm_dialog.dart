import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/app_assets.dart';
import '../../../helpers/app_colors.dart';
import '../../../helpers/app_screen_utils.dart';
import '../../../helpers/app_strings.dart';
import '../../../widgets/custom_button_widget.dart';

class SaleConfirmDialog extends StatelessWidget {
  const SaleConfirmDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: POPUP_COLOR,
      actionsPadding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      content: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(50.0),
              width: ScreenUtils.getDesignWidth(50.0),
              padding: EdgeInsets.all(ScreenUtils.getDesignWidth(15.0)),
              decoration: BoxDecoration(color: TURQUOISE_BLUE_COLOR, shape: BoxShape.circle),
              child: SvgPicture.asset(
                TICK_MARK_ICON,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "And We're Done",
                    style: Theme.of(context).primaryTextTheme.headline1?.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      SMILE_EMOJI,
                      height: ScreenUtils.getDesignHeight(25.0),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Your Games are up for sale! Awesomee Work! You will start getting notifications once you start getting potential buyers, Until then Happy Gaming!",
                style: Theme.of(context).primaryTextTheme.subtitle1?.copyWith(fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CustomButton(
            buttonText: "Back to Home",
            onPressed: () {
              Navigator.pushReplacementNamed(context, MAIN_SCREEN);
              Navigator.of(context).pop();
            },
            gradient: PRIMARY_GRADIENT),
      ],
    );
  }
}
