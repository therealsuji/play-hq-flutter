import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_body.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

class MySalesScreen extends StatefulWidget {
  const MySalesScreen({Key? key}) : super(key: key);

  @override
  _MySalesScreenState createState() => _MySalesScreenState();
}

class _MySalesScreenState extends State<MySalesScreen> {
  var gamesCOunt = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: CustomAppBarWidget(
        title: "My Sales",
        showNotificationIcon: true,
      ),
      body: CustomBody(
        paddingLeft: 0.0,
        paddingRight: 0.0,
        body: [
          Container(
            color: MAIN_CONTAINER_COLOR,
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sale Items",
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
                CustomButton(
                  buttonText: "Filter",
                  gradient: PRIMARY_GRADIENT,
                  width: ScreenUtils.getDesignWidth(90.0),
                  height: ScreenUtils.getDesignHeight(35.0),
                )
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtils.getDesignHeight(335.0),
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9,
                initialPage: 0,
              ),
              itemCount: gamesCOunt,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                return Padding(
                  padding: gamesCOunt == 1
                      ? EdgeInsets.zero
                      : EdgeInsets.only(left: index == 0 ? 0 : 10.0, right: 10.0, top: 15.0),
                  child: _gameSlide(
                      condition: "Mint Condtion",
                      price: "LKR 2000",
                      imageUrl: "https://wallpaperaccess.com/thumb/35386.jpg",
                      platform: "PS4",
                      offers: "12",
                      title: "Legend of Zeld: Breath of the Wild"),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _gameSlide(
      {required String title,
      required String imageUrl,
      required String price,
      required String platform,
      required String condition,
      required String offers}) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Stack(
              children: [
                Container(
                  height: ScreenUtils.getDesignHeight(144.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [MAIN_CONTAINER_COLOR, MAIN_CONTAINER_COLOR.withOpacity(0.5)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenUtils.getDesignWidth(115.0),
                              child: Text(
                                title,
                                style: Theme.of(context).primaryTextTheme.headline4,
                              ),
                            ),
                            Text(
                              condition,
                              style: Theme.of(context).primaryTextTheme.headline6!.copyWith(color: PRIMARY_COLOR),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenUtils.getDesignHeight(10.0)),
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          SizedBox(height: ScreenUtils.getDesignHeight(10.0)),
          Row(
            children: [
              Text(
                price,
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
              SizedBox(width: ScreenUtils.getDesignWidth(10.0)),
              Text(
                platform,
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ],
          ),
          SizedBox(height: ScreenUtils.getDesignHeight(10.0)),
          Row(
            children: [
              Text(
                condition,
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
              SizedBox(width: ScreenUtils.getDesignWidth(10.0)),
              Text(
                offers,
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
