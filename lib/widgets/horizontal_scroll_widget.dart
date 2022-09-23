import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class HorizontalScrollList extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Widget? emptyListWidget;
  final String emptyListText;

  const HorizontalScrollList({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.emptyListWidget,
    this.emptyListText = "No games available yet",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: itemCount > 0
          ? ListView.separated(
              separatorBuilder: (_, __) => SizedBox(
                width: ScreenUtils.getDesignHeight(15.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: itemBuilder,
              itemCount: itemCount,
            )
          : emptyListWidget ??
              Center(
                child: Text(
                  emptyListText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
    );
  }
}
