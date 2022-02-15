import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/screens/create_sale/widgets/create_sale_confirm_bottom_sheet_widget.dart';
import 'package:play_hq/screens/create_sale/widgets/sale_confirm_dialog.dart';
import 'package:play_hq/view_models/sales/create_sale/create_sale_model.dart';
import 'package:play_hq/widgets/custom_body.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_selecting_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/custom_textfield_widget.dart';
import 'package:play_hq/widgets/game_picker_widget.dart';
import 'package:provider/provider.dart';

class CreateSaleScreen extends StatefulWidget {

  final GamePreferances? selectedGame;

  CreateSaleScreen({this.selectedGame});

  @override
  _CreateSaleScreenState createState() => _CreateSaleScreenState();
}

class _CreateSaleScreenState extends State<CreateSaleScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: BACKGROUND_COLOR,
      body: CustomBody(
        paddingLeft: 0.0,
        paddingRight: 0.0,
        body: [
          Consumer<CreateSaleModel>(
            builder: (_, val, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtils.getDesignWidth(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create a Sale",
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Create a sale so you can sell your game super fast",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline5!
                                .copyWith(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ChangeNotifierProvider.value(
                    value: Provider.of<CreateSaleModel>(context),
                    child: CustomGamePicker(
                      gameType: SearchType.CREATE_SALE,
                      bottomMargin: 0,
                      game: widget.selectedGame,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtils.getDesignWidth(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtils.getDesignHeight(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sale Price ",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                              Consumer<CreateSaleModel>(
                                builder: (_, model, __) {
                                  return Text(
                                    "${val.selectedGameList.length == 1 ? 'Single' : val.selectedGameList.length}  ${val.selectedGameList.length == 1 ? 'Game' : 'x Games'}",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline4!
                                        .copyWith(
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
                        Consumer<CreateSaleModel>(builder: (_, model, __) {
                          return CustomTextfieldWidget(
                            type: TextInputType.number,
                            hideText: false,
                            hintText: "Enter the price",
                            onChanged: (value) => value != ""
                                ? model.setPrice(double.parse(value))
                                : model.setPrice(0),
                          );
                        }),
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            child: CustomTextWidget(
                              'Select a Platform',
                              isDynamic: false,
                              width: ScreenUtils.getDesignWidth(131),
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline3!
                                  .copyWith(fontSize: 16),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtils.getDesignHeight(15)),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0.0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                              mainAxisExtent:
                                  ScreenUtils.getDesignHeight(45.0),
                            ),
                            itemCount: platforms.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () => Provider.of<CreateSaleModel>(
                                          context,
                                          listen: false)
                                      .setSelectedPlatform(
                                          platforms.indexOf(platforms[index]),
                                          platforms[index]['id']),
                                  child: CustomSelectingWidget(
                                    titleText: platforms[index]['name'],
                                    active: val.selectedPlatform ==
                                            platforms
                                                .indexOf(platforms[index])
                                        ? true
                                        : false,
                                  ));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Price Negotaible?",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Neusa,
                                      )),
                              Consumer<CreateSaleModel>(
                                builder: (_, model, __) {
                                  return CupertinoSwitch(
                                    activeColor: PRIMARY_COLOR,
                                    onChanged: (bool value) =>
                                        model.setIsNegotiable(value),
                                    value: model.isNegotiable,
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtils.getDesignHeight(30)),
                          child: Text('Other remarks',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline3!
                                  .copyWith(fontFamily: CircularBook)),
                        ),
                        CustomTextfieldWidget(
                          type: TextInputType.multiline,
                          hideText: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Selector<CreateSaleModel, bool>(
                              selector: (_, provider) => provider.isFormValid,
                              builder: (_, formValid, __) {
                                return CustomButton(
                                  onPressed: () async{
                                    formValid ? Provider.of<CreateSaleModel>(context,
                                        listen: false)
                                        .createSale() : showAlertDialog(context);
                                  },
                                  buttonText: "Create Sale",
                                  gradient: formValid ? GREEN_GRADIENT : null,
                                  buttonColor: formValid ? null : Colors.grey,
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }


  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Nope"),
      content: Text("You need to fill all the required details"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> showCompleteDialog() async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SaleConfirmDialog();
        });
  }

  Future<bool> showSalesConfirmBottomSheet() async {
    CreateSaleModel model =
        Provider.of<CreateSaleModel>(context, listen: false);
    var confirmed = await showModalBottomSheet<bool>(
      isDismissible: false,
      context: context,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: model,
          child: CreateSaleConfirmBottomSheet(),
        );
      },
    );
    return confirmed ?? false;
  }
}
