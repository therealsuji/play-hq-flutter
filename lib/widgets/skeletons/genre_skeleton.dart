import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonGenreWidget extends StatelessWidget {
  final double height;
  final double width;
  const SkeletonGenreWidget({Key? key, this.height = 99, this.width = 99}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style:
      SkeletonLineStyle(height: height, width: width, borderRadius: BorderRadius.circular(8)),
    );
  }
}