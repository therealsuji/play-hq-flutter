import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class LoadingBarrier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              child: const ModalBarrier(dismissible: false, color: BACKGROUND_COLOR,)),
          Center(
            child: Container(
                height: ScreenUtils.getDesignHeight(120),
                width: ScreenUtils.getDesignWidth(120),
                child: Lottie.asset('assets/animations/loading.json')),
          )
        ],
      ),
    );
  }
}