import 'package:flutter/material.dart';
import 'package:play_hq/view-models/loading-overlay/loading-overlay-model.dart';
import 'package:provider/provider.dart';

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
                    color: Colors.red.withOpacity(0.2),
                    height: double.infinity,
                    width: double.infinity,
                  )
                : Container();
          },
        ),
      ],
    );
  }
}
