import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomLoadingBarrier extends StatelessWidget {

  final String? path;

  CustomLoadingBarrier({this.path});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
                child: const ModalBarrier(dismissible: false, color: Color.fromRGBO(0, 0, 0, 0.5),)),
            Center(
              child: Container(
                  child: Lottie.asset(path!)),
            )
          ],
        ),
      ),
    );
  }
}
