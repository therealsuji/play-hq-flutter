import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/create_sale/create_sale_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

const List<Map<String, dynamic>> _game_condtion = [
  {
    "name": "Mint Sealed",
    "value": GameCondition.MINT_SEALED,
  },
  {
    "name": "Very New",
    "value": GameCondition.VERY_NEW,
  },
  {
    "name": "Kinda Used",
    "value": GameCondition.KINDA_USED,
  },
  {
    "name": "Playable",
    "value": GameCondition.PLAYABLE,
  }
];

class CreateSaleBottomSheetWidget extends StatelessWidget {
  const CreateSaleBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 30.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: POPUP_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Platform",
              style: Theme.of(context).primaryTextTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Consumer<CreateSaleModel>(builder: (_, model, __) {
                return Container();
                // return GridView.builder(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 3,
                //     mainAxisSpacing: 10.0,
                //     crossAxisSpacing: 10.0,
                //     mainAxisExtent: ScreenUtils.getDesignHeight(35.0),
                //   ),
                //   itemCount: model.consoleList.length + 1,
                //   itemBuilder: (context, index) {
                //     if (index == model.consoleList.length) {
                //       return GestureDetector(
                //         onTap: () {
                //           model.setPlatformIsExpanded(!model.platformIsExpanded);
                //         },
                //         child: _textButton(model.platformIsExpanded ? "- Less" : "+ More", false),
                //       );
                //     }
                //     return GestureDetector(
                //       onTap: () {
                //       },
                //       child: _textButton(model.consoleList.elementAt(index)['name'],
                //           model.selectedPlatform == model.consoleList.elementAt(index)['id']),
                //     );
                //   },
                // );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Gmae Condition",
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Consumer<CreateSaleModel>(builder: (_, model, __) {
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    mainAxisExtent: ScreenUtils.getDesignHeight(35.0),
                  ),
                  itemCount: _game_condtion.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                      },
                      child: _textButton(
                          _game_condtion[index]['name'], '' == _game_condtion[index]['value']),
                    );
                  },
                );
              }),
            ),
            ...[
              // if (Provider.of<CreateSaleModel>(context, listen: false).selectedGame != null)
              //   Consumer<CreateSaleModel>(builder: (_, model, __) {
              //     return Padding(
              //       padding: const EdgeInsets.only(top: 20.0),
              //       child: Container(
              //         width: double.infinity,
              //         height: ScreenUtils.getDesignHeight(50.0),
              //         child: TextButton(
              //           onPressed: () {
              //             Navigator.pop(context);
              //           },
              //           child: Text(
              //             "DELETE GAME",
              //             style: Theme.of(context).primaryTextTheme.headline4,
              //           ),
              //         ),
              //       ),
              //     );
              //   })
            ],
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Consumer<CreateSaleModel>(builder: (_, model, __) {
            //     return CustomButton(
            //       buttonText: "Save Game Details",
            //       buttonColor:
            //           (model.selectedGameCondition != null && model.selectedPlatform != null) ? null : Colors.grey,
            //       gradient:
            //           (model.selectedGameCondition != null && model.selectedPlatform != null) ? GREEN_GRADIENT : null,
            //       onPressed: () {
            //         if (model.selectedGameCondition != null && model.selectedPlatform != null) {
            //           // if (model.selectedGame != null) {
            //           //   model.updateGame(model.selectedGame);
            //           //   Navigator.pop(context);
            //           // } else {
            //           //   model.setSheetSaved(true);
            //           //   Navigator.pop(context);
            //           // }
            //         }
            //       },
            //     );
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}

Container _textButton(text, selected) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: !selected ? MAIN_CONTAINER_COLOR.withOpacity(0.5) : null,
      gradient: selected ? PRIMARY_GRADIENT : null,
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.all(8.0),
    height: ScreenUtils.getDesignHeight(35.0),
    child: Text(text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: CircularBook,
          fontWeight: FontWeight.bold,
        )),
  );
}
