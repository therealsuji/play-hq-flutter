import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/sales/create_sale/create_sale_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_selecting_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class UpdateGameBottomSheet extends StatefulWidget {

  final int? id;

  UpdateGameBottomSheet({
    this.id,
  });

  @override
  State<UpdateGameBottomSheet> createState() => _UpdateGameBottomSheetState();
}

class _UpdateGameBottomSheetState extends State<UpdateGameBottomSheet> {
  @override
  Widget build(BuildContext context) {
    print('Game ID is ${widget.id}');

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
              Consumer<CreateSaleModel>(
                builder: (_ , val, __) {
                  return Container(
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
                              Provider.of<CreateSaleModel>(context, listen: false).changeCurrentCondition(game_conditions[index]['name']!);
                            },
                            child: CustomSelectingWidget(
                              titleText: game_conditions[index]['name'],
                              active: val.currentCondition == game_conditions[index]['name'],
                            ));
                      },
                    ),
                  );
                }
              ),
              GestureDetector(
                onTap: () {
                  showAlertDialog(context , 'Are you sure mate?' , 'Are you sure you want to delete this game?' , (){
                    Provider.of<CreateSaleModel>(context, listen: false).removeGame(widget.id!);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Center(child: CustomTextWidget('DELETE GAME', isDynamic: false , width: ScreenUtils.getDesignWidth(115) , style: Theme.of(context).primaryTextTheme.headline3!.copyWith(color: Colors.red),)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: CustomButton(
                  buttonText: 'Update Game Details', gradient: GREEN_GRADIENT, onPressed: () {
                  Provider.of<CreateSaleModel>(context, listen: false).updateGame(widget.id!);
                },),
              ),
            ],
          ),
        )
    );
  }

  showAlertDialog(BuildContext context , String title , String message , VoidCallback clickedYes) {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    Widget okButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        clickedYes();
        Navigator.of(context, rootNavigator: true).pop();
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
