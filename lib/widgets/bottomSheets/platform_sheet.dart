import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/app_screen_utils.dart';
import '../../models/common_models/rawg_platform_model.dart';
import '../../view_models/game_details/game_details_model.dart';
import '../custom_button_widget.dart';
import '../custom_selecting_widget.dart';

class PlatformBottomSheet extends StatelessWidget {

  final List<RawgPlatformModel>? platformList;
  final PlatformBottomSheetType? bottomSheetType;
  final VoidCallback? onPressed;

  PlatformBottomSheet({required this.platformList , required this.bottomSheetType , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(30), left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("Select your Console",
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline5
                    ?.copyWith(fontSize: 16)),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                mainAxisExtent: ScreenUtils.getDesignHeight(45.0),
              ),
              itemCount: platformList!.length,
              itemBuilder: (BuildContext context, index) {
                switch (bottomSheetType){
                  case PlatformBottomSheetType.ADD_TO_WISHLIST:
                    return Container();
                  case PlatformBottomSheetType.ADD_TO_LIBRARY:
                    return Container();
                  case PlatformBottomSheetType.GAME_DETAIL_ADD:
                    return GestureDetector(
                      child: Consumer<GameDetailsModel>(
                        builder: (_, model, __) {
                          return CustomSelectingWidget(
                            titleText: platformList![index].name,
                            active:
                            model.selectedPlatformId == platformList![index].id,
                          );
                        },
                      ),
                      onTap: () =>
                          Provider.of<GameDetailsModel>(context, listen: false)
                              .selectedPlatform(platformList![index].id!),
                    );
                  default:
                    return Container(child: Text('Error'),);
                }
              },
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtils.getDesignHeight(40)),
            child: CustomButton(
              buttonText: 'Confirm',
              gradient: GREEN_GRADIENT,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
