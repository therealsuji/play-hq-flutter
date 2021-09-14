import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/purchase-account-model.dart';
import 'package:play_hq/view-models/onboarding/setup-sales-account-view-model/sales-account-model.dart';
import 'package:play_hq/view-models/search-game/search-game-view-model.dart';
import 'package:play_hq/widgets/custom-loading-barrier-widget.dart';
import 'package:play_hq/widgets/custom-search-item-widget.dart';
import 'package:provider/provider.dart';

class CustomSearchScreen extends StatefulWidget {
  final SearchGameScreens? values;

  CustomSearchScreen({this.values});

  @override
  _CustomSearchScreenState createState() => _CustomSearchScreenState();
}

class _CustomSearchScreenState extends State<CustomSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            currentFocus.unfocus();
          },
          child: Container(
            color: BACKGROUND_COLOR,
            child: Column(
              children: [
                Consumer<SearchGameModel>(
                  builder: (_, val, __) {
                    switch (val.states) {
                      case SearchScreenStates.EMPTY:
                        return Container();
                        break;
                      case SearchScreenStates.LOADING:
                        return CustomLoadingBarrier(path: 'assets/animations/search.json');
                        break;
                      case SearchScreenStates.SUCCESS:
                        return Expanded(
                          child: ListView.builder(
                              itemCount: val.gameList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    switch (widget.values) {
                                      case SearchGameScreens.SetupPurchase:
                                        Provider.of<SetupPurchaseAccountModel>(context, listen: false)
                                            .addSelectedGame(val.gameList[index]);
                                        locator<NavigationService>().pushNamed(PURCHASE_ACCOUNT_SCREEN);
                                        break;
                                      case SearchGameScreens.SetupSales:
                                        Provider.of<SetupSalesModel>(context, listen: false)
                                            .addSelectedGame(val.gameList[index]);
                                        locator<NavigationService>().pushNamed(SALES_ACCOUNT_SCREEN);
                                        break;
                                      case SearchGameScreens.CreateSales:
                                        // Provider.of<CreateSaleModel>(context, listen: false)
                                        //     .addGame(val.gameList[index]);
                                        var game = val.gameList[index];
                                        Navigator.pop(context, {"id": game.id, "image": game.image, "name": game.name});
                                        break;
                                      default:
                                        print('Something went wrong');
                                    }
                                  },
                                  child: SearchGameItem(
                                    releaseDate: val.gameList[index].released,
                                    title: val.gameList[index].name,
                                    imageUrl: val.gameList[index].image,
                                  ),
                                );
                              }),
                        );
                      case SearchScreenStates.NOTHING:
                        return CustomLoadingBarrier(
                          path: 'assets/animations/search-failed.json',
                        );
                        break;
                      case SearchScreenStates.FAILED:
                        return CustomLoadingBarrier(
                          path: 'assets/animations/error.json',
                        );
                        break;
                      default:
                        return Container();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
