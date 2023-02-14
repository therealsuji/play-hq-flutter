import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class PageViewTab extends StatelessWidget {
  final List<dynamic> tabs;
  final PageController? controller;
  final int activeTab;
  final MainAxisAlignment mainAxisAlignment;
  final double tabPadding;
  final bool tabsExpanded;
  final Function(int index) onTap;
  const PageViewTab({
    Key? key,
    required this.tabs,
    required this.activeTab,
    required this.onTap,
    this.controller,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.tabPadding = 0,
    this.tabsExpanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
      ),
      height: ScreenUtils.getDesignHeight(40),
      width: double.infinity,
      child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: tabs
              .asMap()
              .entries
              .map(
                (e) => Expanded(
                  flex: tabsExpanded ? 1 : 0,
                  child: GestureDetector(
                    onTap: () => {
                      controller?.animateToPage(e.key,
                          duration: Duration(milliseconds: 700), curve: Curves.fastLinearToSlowEaseIn),
                      onTap(e.key)
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: e.key == activeTab ? PRIMARY_GRADIENT : null,
                          color: e.key == activeTab ? null : MAIN_CONTAINER_COLOR.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: tabPadding),
                        child: e.value.runtimeType != String
                            ? e.value
                            : Center(
                                child: Text(
                                  e.value,
                                  style: Theme.of(context).primaryTextTheme.bodyText1,
                                ),
                              )),
                  ),
                ),
              )
              .toList()),
    );
  }
}
