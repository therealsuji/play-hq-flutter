import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';

class LoadingBarrier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              child: const ModalBarrier(dismissible: false, color: Background,)),
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