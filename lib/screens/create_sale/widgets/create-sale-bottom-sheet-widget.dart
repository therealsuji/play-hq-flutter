import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
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
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    mainAxisExtent: ScreenUtils.getDesignHeight(35.0),
                  ),
                  itemCount: model.consoleList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == model.consoleList.length) {
                      return GestureDetector(
                        onTap: () {
                          model.setPlatformIsExpanded(!model.platformIsExpanded);
                        },
                        child: _textButton(model.platformIsExpanded ? "- Less" : "+ More", false),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        model.setSelectedPlatform(model.consoleList.elementAt(index)['id']);
                      },
                      child: _textButton(model.consoleList.elementAt(index)['name'],
                          model.selectedPlatform == model.consoleList.elementAt(index)['id']),
                    );
                  },
                );
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
                        model.setSelectedGameCondition(_game_condtion[index]['value']);
                      },
                      child: _textButton(
                          _game_condtion[index]['name'], model.selectedGameCondition == _game_condtion[index]['value']),
                    );
                  },
                );
              }),
            ),
            ...[
              if (Provider.of<CreateSaleModel>(context, listen: false).selectedGame != null)
                Consumer<CreateSaleModel>(builder: (_, model, __) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: double.infinity,
                      height: ScreenUtils.getDesignHeight(50.0),
                      child: TextButton(
                        onPressed: () {
                          model.removeGame(model.selectedGame);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "DELETE GAME",
                          style: TextStyle(fontFamily: Neusa, fontSize: 16, color: PRIMARY_COLOR),
                        ),
                      ),
                    ),
                  );
                })
            ],
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Consumer<CreateSaleModel>(builder: (_, model, __) {
                return CustomButton(
                  buttonText: "Save Game Details",
                  buttonColor:
                      (model.selectedGameCondition != null && model.selectedPlatform != null) ? null : Colors.grey,
                  gradient:
                      (model.selectedGameCondition != null && model.selectedPlatform != null) ? GREEN_GRADIENT : null,
                  onPressed: () {
                    if (model.selectedGameCondition != null && model.selectedPlatform != null) {
                      if (model.selectedGame != null) {
                        model.updateGame(model.selectedGame);
                        Navigator.pop(context);
                      } else {
                        model.setSheetSaved(true);
                        Navigator.pop(context);
                      }
                    }
                  },
                );
              }),
            ),
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
          fontFamily: CircularBold,
          fontWeight: FontWeight.bold,
        )),
  );
}
