import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class UserSkeleton extends StatelessWidget {
  const UserSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLine(
              style: SkeletonLineStyle(
                  width: 180,
                  borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: SkeletonLine(
                style: SkeletonLineStyle(
                    width: 100,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ],
        ),
        Spacer(),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(height: 60, width: 60 , borderRadius: BorderRadius.circular(50)),
        ),
      ],
    );
  }
}
