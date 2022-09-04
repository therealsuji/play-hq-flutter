import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class PageViewTab extends StatelessWidget {
  final List<String> tabs;
  final PageController? controller;
  final int activeTab;
  final Function(int index) onTap;
  const PageViewTab({Key? key, required this.tabs, required this.activeTab, required this.onTap, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
      ),
      height: ScreenUtils.getDesignHeight(40),
      width: double.infinity,
      child: Row(
          children: tabs
              .asMap()
              .entries
              .map(
                (e) => Expanded(
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
                        child: Center(
                          child: Text(
                            e.value,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        )),
                  ),
                ),
              )
              .toList()),
    );
  }
}
