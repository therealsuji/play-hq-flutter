import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomLoadingBarrier extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              child: const ModalBarrier(dismissible: false, color: Color.fromRGBO(0, 0, 0, 0.5),)),
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
