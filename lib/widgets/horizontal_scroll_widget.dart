import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class HorizontalScrollList extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Axis? axis;
  final Widget? emptyListWidget;
  final String emptyListText;

  const HorizontalScrollList({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.axis = Axis.horizontal,
    this.emptyListWidget,
    this.emptyListText = "No games available yet",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: itemCount > 0
          ? ListView.separated(
              separatorBuilder: (_, __) => SizedBox(
                width: axis == Axis.horizontal ? ScreenUtils.getDesignWidth(15.0) : 0,
                height: axis == Axis.horizontal ? 0 : ScreenUtils.getDesignHeight(15),
              ),
              padding: axis == Axis.horizontal ? EdgeInsets.symmetric(horizontal: 24) : EdgeInsets.symmetric(vertical: 24 , horizontal: 24),
              scrollDirection: axis ?? Axis.horizontal,
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
