import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:provider/provider.dart';

import 'package:play_hq/view_models/loading_overlay/loading_overlay_model.dart';

class LoadingWidget extends StatelessWidget {
  final Widget? child;
  const LoadingWidget({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (child != null) child!,
        Consumer<LoadingOverlayModel>(
          builder: (_, model, __) {
            return model.isLoading
                ? Container(
              child: Stack(
                children: <Widget>[
                  Container(
                      child: const ModalBarrier(dismissible: false, color:  BACKGROUND_COLOR)),
                  Center(
                    child: Container(
                        height: ScreenUtils.getDesignHeight(100),
                        width: ScreenUtils.getDesignWidth(100),
                        child: Lottie.asset('assets/animations/loading.json')),
                  )
                ],
              ),
            )
                : Container();
          },
        ),
      ],
    );
  }
}
