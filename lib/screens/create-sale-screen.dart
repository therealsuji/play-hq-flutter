import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/custom-dotted-selector-widget.dart';
import 'package:play_hq/widgets/custom-textfield-widget.dart';
import 'package:play_hq/widgets/select-game-item-widget.dart';
import 'package:provider/provider.dart';

class CreateSaleScreen extends StatefulWidget {
  @override
  _CreateSaleScreenState createState() => _CreateSaleScreenState();
}

List<String> _platforms = [
  "PlayStation 4",
  "Xbox One",
  "Nintendo Switch",
  "Playstation 3",
  "Xbox 360",
];

class _CreateSaleScreenState extends State<CreateSaleScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Map<String, dynamic>> _gameCondition = [
    {"name": 'Used', "status": true},
    {"name": 'New', "status": false},
    {"name": 'Mint', "status": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtils.getDesignWidth(24.0),
            vertical: ScreenUtils.getDesignHeight(45.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create a Sale",
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Create a sale so you can sell your game super fast",
                  style: Theme.of(context).primaryTextTheme.subtitle2.copyWith(
                        color: Color(0xffB5BDD5).withOpacity(0.8),
                      ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                height: ScreenUtils.getDesignHeight(124.0),
                child: Row(
                  children: [
                    Consumer<CreateSaleModel>(builder: (_, model, __) {
                      return Expanded(
                        child: ListView.separated(
                          itemCount: model.gameList.length + 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, idx) {
                            if (idx == 0) {
                              return GestureDetector(
                                onTap: () async {
                                  var game = await locator<NavigationService>()
                                      .pushNamed(SEARCH_SCREEN, args: SearchGameScreens.CreateSales);
                                  if (game != null) {
                                    Provider.of<CreateSaleModel>(context, listen: false).addGame(game.first);
                                  }
                                },
                                child: CustomDottedSelectorWidget(
                                  filled: true,
                                ),
                              );
                            }
                            return SelectGameItem(
                              imageURL: model.gameList[idx - 1].image,
                              titleText: model.gameList[idx - 1].name,
                              isSelected: false,
                              isDismisable: true,
                              dismissPressed: () => {
                                Provider.of<CreateSaleModel>(context, listen: false).removeGame(model.gameList[idx - 1])
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            if (index == 0) return Container();
                            return SizedBox(
                              width: ScreenUtils.getDesignWidth(15.0),
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                child: Row(
                  children: [
                    Text(
                      "Sale Price ",
                      style: Theme.of(context).primaryTextTheme.headline2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: Neusa,
                          ),
                    ),
                    Consumer<CreateSaleModel>(
                      builder: (_, model, __) {
                        return Text(
                          model.gameList.length <= 1 ? 'of Game' : "${model.gameList.length}x Games",
                          style: Theme.of(context).primaryTextTheme.headline2.copyWith(
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.bold,
                                fontFamily: Neusa,
                              ),
                        );
                      },
                    )
                  ],
                ),
              ),
              CustomTextfieldWidget(
                type: TextInputType.text,
                hideText: false,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Price Negotaible?",
                        style: Theme.of(context).primaryTextTheme.headline2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: Neusa,
                            )),
                    CupertinoSwitch(
                      activeColor: PRIMARY_COLOR,
                      onChanged: (bool value) {},
                      value: true,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                child: Text(
                  'Other remarks',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: CircularBook),
                ),
              ),
              CustomTextfieldWidget(
                type: TextInputType.multiline,
                hideText: false,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: CustomButton(
                  buttonText: "Create Sale",
                  buttonColor: LIME_COLOR,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
