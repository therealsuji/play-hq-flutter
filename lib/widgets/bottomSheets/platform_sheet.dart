import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/view_models/view_models.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/app_screen_utils.dart';
import '../../models/common_models/rawg_platform_model.dart';
import '../custom_button_widget.dart';
import '../custom_selecting_widget.dart';

class PlatformBottomSheet extends StatelessWidget {
  final List<RawgPlatformModel>? platformList;
  final PlatformBottomSheetType? bottomSheetType;
  final VoidCallback? onPressed;

  PlatformBottomSheet(
      {required this.platformList, required this.bottomSheetType, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    List<RawgPlatformModel> platforms = platformList!;
    platforms.removeWhere((element) => element.name == 'PC');
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30), left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("Select your Preferred Console",
                style: Theme.of(context).primaryTextTheme.headline5?.copyWith(fontSize: 16)),
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
              itemCount: platforms.length,
              itemBuilder: (BuildContext context, index) {
                switch (bottomSheetType) {
                  case PlatformBottomSheetType.SETUP_WISHLIST_GAMES:
                    return GestureDetector(
                      child: Consumer<CustomSearchModel>(
                        builder: (_, model, __) {
                          return CustomSelectingWidget(
                            titleText: platforms[index].name,
                            active: model.selectedPlatformId == platforms[index].id,
                          );
                        },
                      ),
                      onTap: () => Provider.of<CustomSearchModel>(context, listen: false)
                          .addPlatform(index, platforms[index].id ?? 0),
                    );
                  case PlatformBottomSheetType.SETUP_LIBRARY_GAMES:
                    return GestureDetector(
                      child: Consumer<CustomSearchModel>(
                        builder: (_, model, __) {
                          return CustomSelectingWidget(
                            titleText: platforms[index].name,
                            active: model.selectedPlatformId == platforms[index].id,
                          );
                        },
                      ),
                      onTap: () => Provider.of<CustomSearchModel>(context, listen: false)
                          .addPlatform(index, platforms[index].id ?? 0),
                    );
                  case PlatformBottomSheetType.GAME_DETAIL_ADD:
                    return GestureDetector(
                      child: Consumer<GameDetailsViewModel>(
                        builder: (_, model, __) {
                          return CustomSelectingWidget(
                            titleText: platforms[index].name,
                            active: model.selectedPlatformId == platforms[index].id,
                          );
                        },
                      ),
                      onTap: () => Provider.of<GameDetailsViewModel>(context, listen: false)
                          .selectedPlatform(platforms[index].id ?? 0),
                    );
                  case PlatformBottomSheetType.HOME_SCREEN_ADD:
                    return GestureDetector(
                      child: Consumer<HomeScreenModel>(
                        builder: (_, model, __) {
                          return CustomSelectingWidget(
                            titleText: platforms[index].name,
                            active: model.selectedPlatformId == platforms[index].id,
                          );
                        },
                      ),
                      onTap: () {
                        Provider.of<HomeScreenModel>(context, listen: false).selectPlatform(platforms[index].id ?? 0);
                      },
                    );
                  default:
                    return Container(
                      child: Text('Error'),
                    );
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
