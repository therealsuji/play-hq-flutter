import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class HorizontalScrollList extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final List list;

  const HorizontalScrollList({Key? key, required this.list, required this.itemBuilder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(205),
      child: ListView.separated(
        separatorBuilder: (_, __) => SizedBox(
          width: ScreenUtils.getDesignHeight(15.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        itemCount: list.length,
      ),
    );
  }
}
