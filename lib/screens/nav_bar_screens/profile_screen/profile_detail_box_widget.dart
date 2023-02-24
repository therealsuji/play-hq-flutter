import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_fonts.dart';
import '../../../helpers/app_screen_utils.dart';
import '../../../widgets/custom_game_widget.dart';

class ProfileDetailsBox extends StatelessWidget {
  final int? wishlistCount;
  final int? gamerfriendCount;
  final int? libraryCount;

  const ProfileDetailsBox(
      {this.gamerfriendCount, this.libraryCount, this.wishlistCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.bodyWidth,
      height: ScreenUtils.getDesignHeight(80),
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: ScreenUtils.getDesignHeight(80),
            width: ScreenUtils.getDesignWidth(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MAIN_CONTAINER_COLOR,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${wishlistCount! < 10 ? '0$wishlistCount' : wishlistCount}',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: Neusa,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Wishlist Games',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: CircularBook,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: ScreenUtils.getDesignHeight(80),
            width: ScreenUtils.getDesignWidth(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MAIN_CONTAINER_COLOR,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${gamerfriendCount! < 10 ? '0$gamerfriendCount' : gamerfriendCount}',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: Neusa,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Gamer Friends',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: CircularBook,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: ScreenUtils.getDesignHeight(80),
            width: ScreenUtils.getDesignWidth(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MAIN_CONTAINER_COLOR,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${libraryCount! < 10 ? '0$libraryCount' : libraryCount}',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: Neusa,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Library Games',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: CircularBook,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6),
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

class SkeletonProfileDetails extends StatelessWidget {
  final double height;
  final double width;
  final count;

  const SkeletonProfileDetails(
      {Key? key, this.height = 160, this.width = 100, this.count = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.bodyWidth,
      height: ScreenUtils.getDesignHeight(80),
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SkeletonLine(
            style: SkeletonLineStyle(
                height: ScreenUtils.getDesignHeight(80),
                width: ScreenUtils.getDesignWidth(100),
                borderRadius: BorderRadius.circular(8)),
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                height: ScreenUtils.getDesignHeight(80),
                width: ScreenUtils.getDesignWidth(100),
                borderRadius: BorderRadius.circular(8)),
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                height: ScreenUtils.getDesignHeight(80),
                width: ScreenUtils.getDesignWidth(100),
                borderRadius: BorderRadius.circular(8)),
          )
        ],
      ),
    );
  }
}
