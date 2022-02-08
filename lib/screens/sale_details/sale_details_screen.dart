import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/screens/sale_details/widgets/sale_details_bottom_sheet.dart';
import 'package:play_hq/view_models/sale_details/sale_details_model.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:provider/provider.dart';

class SaleDetailsScreen extends StatefulWidget {
  const SaleDetailsScreen({Key? key}) : super(key: key);

  @override
  _SaleDetailsScreenState createState() => _SaleDetailsScreenState();
}

class _SaleDetailsScreenState extends State<SaleDetailsScreen> {
  int gamesCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: CustomAppBarWidget(
        title: "Sale Details",
        showNotificationIcon: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20.0)),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtils.getDesignHeight(200.0),
                          child: PageView.builder(
                            controller: PageController(
                              viewportFraction: 0.9,
                              initialPage: 0,
                            ),
                            itemCount: gamesCount,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: gamesCount == 1
                                    ? EdgeInsets.zero
                                    : EdgeInsets.only(left: index == 0 ? 0 : 10.0, right: 10.0),
                                child: _gameSlide(
                                    condition: "Mint Condtion",
                                    date: "12/03/2020",
                                    imageUrl: "https://wallpaperaccess.com/thumb/35386.jpg",
                                    platform: "PS4",
                                    rating: "12.0",
                                    title: "Spider Man 3"),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Negotiable", style: Theme.of(context).primaryTextTheme.headline4),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: PRIMARY_COLOR,
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(7),
                                      child: SvgPicture.asset(
                                        true ? TICK_MARK_ICON : CROSS_MARK_ICON,
                                        color: Colors.white,
                                        height: ScreenUtils.getDesignHeight(8.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                color: PRIMARY_COLOR,
                                height: 2,
                                margin: EdgeInsets.only(top: 15.0),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text("Seller Location", style: Theme.of(context).primaryTextTheme.headline4),
                              SizedBox(height: 5.0),
                              Text("No 02 6th Lane Colombo 06 ",
                                  style: Theme.of(context).primaryTextTheme.headline6!.copyWith(color: SUB_TEXT_COLOR)),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                color: PRIMARY_COLOR,
                                height: 2,
                              ),
                              SizedBox(height: 25.0),
                              Text("Seller Details", style: Theme.of(context).primaryTextTheme.headline4),
                              SizedBox(height: 20.0),
                              _sellerDetails(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.black,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtils.getDesignHeight(17.0),
                        horizontal: ScreenUtils.getDesignWidth(24.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Price",
                                style: Theme.of(context).primaryTextTheme.headline5!.copyWith(fontFamily: Neusa),
                              ),
                              GradientText("5200 LKR", gradient: GREEN_GRADIENT)
                            ],
                          ),
                          CustomButton(
                            buttonText: "Buy Now",
                            onPressed: () => _openBottomSheet(),
                            gradient: PRIMARY_GRADIENT,
                            width: ScreenUtils.getDesignWidth(110.0),
                            height: ScreenUtils.getDesignHeight(40.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sellerDetails() {
    return Container(
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
        child: Row(
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(58),
              width: ScreenUtils.getDesignWidth(58),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/user.jpg',
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Richard Kenwood', style: Theme.of(context).primaryTextTheme.headline4),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        STAR_ICON,
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          "4.2 (32)",
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: PRIMARY_GRADIENT,
                ),
                padding: EdgeInsets.all(
                  ScreenUtils.getDesignHeight(6.0),
                ),
                child: SvgPicture.asset(
                  ARROW_RIGHT_ICON,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _gameSlide({
    required String title,
    required String imageUrl,
    required String date,
    required String platform,
    required String condition,
    required String rating,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Stack(
            children: [
              CachedNetworkImage(
                height: ScreenUtils.totalBodyHeight,
                width: ScreenUtils.bodyWidth,
                placeholder: (context, url) => Center(
                  child: Container(height: 50, width: 50, child: CircularProgressIndicator()),
                ),
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                color: Color(0xFF08090A).withOpacity(0.7),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        date,
                        style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                          fontSize: 16.0,
                          color: PRIMARY_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          bottom: -25,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: ScreenUtils.getDesignHeight(65.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: SUB_TEXT_COLOR),
                color: SubContainerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          platform,
                          style: Theme.of(context).primaryTextTheme.headline6,
                        ),
                        Text(
                          condition,
                          style: Theme.of(context).primaryTextTheme.headline6!.copyWith(
                            color: PRIMARY_COLOR,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: PRIMARY_COLOR,
                      ),
                      height: ScreenUtils.getDesignHeight(45.0),
                      width: ScreenUtils.getDesignWidth(45.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              rating,
                              style: Theme.of(context).primaryTextTheme.headline5,
                            ),
                          ),
                          SvgPicture.asset(
                            STAR_ICON,
                            width: 12.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _openBottomSheet() async {
    SaleDetailsModel model = Provider.of<SaleDetailsModel>(context, listen: false);
    await showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: model,
          child: SaleDetailsBottomSheet(),
        );
      },
    );
  }
}
