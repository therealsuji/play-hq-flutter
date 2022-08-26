import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/cached_image_widget.dart';

class GenreWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Gradient gradient;

  GenreWidget({Key? key, required this.name, required this.imageUrl, required this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignWidth(99.0),
      width: ScreenUtils.getDesignWidth(99.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Stack(
        children: [
          Container(
            height: ScreenUtils.getDesignWidth(99.0),
            width: ScreenUtils.getDesignWidth(99.0),
            decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset(imageUrl, fit: BoxFit.fitWidth),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    name,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
