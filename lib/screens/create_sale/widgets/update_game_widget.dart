import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/create_sale/create_sale_model.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';
import 'package:play_hq/view_models/onboarding/setup_sales_account_view_model/sales-account-model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_selecting_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class UpdateGameBottomSheet extends StatelessWidget {

  final int? id;
  final CreateSaleModel? createSaleModel;

  UpdateGameBottomSheet({
    @required this.id,
    @required this.createSaleModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtils.getDesignHeight(360),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
          color: POPUP_COLOR,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget('Game Condition', isDynamic: false , width: ScreenUtils.getDesignWidth(115) , style: Theme.of(context).primaryTextTheme.headline4,),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                    mainAxisExtent: ScreenUtils.getDesignHeight(45.0),
                  ),
                  itemCount: game_conditions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          createSaleModel?.changeCurrentCondition(game_conditions[index]['name']);
                        },
                        child: CustomSelectingWidget(
                          titleText: game_conditions[index]['name'],
                          active: createSaleModel!.currentCondition == game_conditions[index]['name'],
                        ));
                  },
                ),
              ),
              GestureDetector(
                onTap: () => showAlertDialog(context , 'Are you sure mate?' , 'Are you sure you want to delete this game?' , (){
                  createSaleModel?.removeGame(id!);
                }),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Center(child: CustomTextWidget('DELETE GAME', isDynamic: false , width: ScreenUtils.getDesignWidth(115) , style: Theme.of(context).primaryTextTheme.headline3!.copyWith(color: Colors.red),)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: CustomButton(
                  buttonText: 'Update Game Details', gradient: GREEN_GRADIENT, onPressed: () {showAlertDialog(context, 'Update Condition?', 'You sure you want to change the games condition??', (){
                    createSaleModel?.updateGame(id!);
                  });
                },),
              ),
            ],
          ),
        )
    );
  }

  showAlertDialog(BuildContext context , String title , String message , Function onPressed) {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget okButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        onPressed();
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        cancelButton,
        okButton
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
}
