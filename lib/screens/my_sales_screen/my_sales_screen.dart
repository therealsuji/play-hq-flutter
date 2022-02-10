import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_body.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';

class MySalesScreen extends StatefulWidget {
  const MySalesScreen({Key? key}) : super(key: key);

  @override
  _MySalesScreenState createState() => _MySalesScreenState();
}

class _MySalesScreenState extends State<MySalesScreen> {
  var gamesCOunt = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppBarWidget(
          title: "My Sales",
          showNotificationIcon: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                color: MAIN_CONTAINER_COLOR,
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sale Items",
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gameForSaleWidget({
    required List<GameModel> gameImages,
    required int offerCount,
    required String platform,
    required double price,
  }) {
    return Container(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20 , horizontal: 15),
        child: Column(
          children: [
            Row(
              children: gameImages.map((e) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      '',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
