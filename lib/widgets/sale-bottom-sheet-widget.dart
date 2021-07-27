import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-fonts.dart';
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

class SaleBottomSheetWidget extends StatelessWidget {
  const SaleBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtils.getDesignHeight(375.0),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 30.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CONTAINER_COLOR,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Platform",
            style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: Neusa,
                  color: Colors.white,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Consumer<CreateSaleModel>(builder: (_, model, __) {
              return Wrap(
                runAlignment: WrapAlignment.center,
                runSpacing: 10.0,
                spacing: 10.0,
                children: [
                  ...model.consoleList.map((console) {
                    return GestureDetector(
                      onTap: () {
                        model.setSelectedPlatform(console['id']);
                      },
                      child: _textButton(console['name'], model.selectedPlatform == console['id']),
                    );
                  }).toList(),
                  GestureDetector(
                    onTap: () {
                      model.setPlatformIsExpanded(!model.platformIsExpanded);
                    },
                    child: _textButton(model.platformIsExpanded ? "- Less" : "+ More", false),
                  )
                ],
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Gmae Condition",
              style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: Neusa,
                    color: Colors.white,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Consumer<CreateSaleModel>(builder: (_, model, __) {
              return Wrap(
                runSpacing: 10.0,
                spacing: 10.0,
                children: _game_condtion.map((condtion) {
                  return GestureDetector(
                    onTap: () {
                      model.setSelectedGameCondition(condtion['value']);
                    },
                    child: _textButton(condtion['name'], model.selectedGameCondition == condtion['value']),
                  );
                }).toList(),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Consumer<CreateSaleModel>(builder: (_, model, __) {
              return CustomButton(
                buttonText: "Save Details",
                buttonColor:
                    (model.selectedGameCondition != null && model.selectedPlatform != null) ? LIME_COLOR : Colors.grey,
                onPressed: () {
                  if (model.selectedGameCondition != null && model.selectedPlatform != null) {
                    model.setSheetSaved(true);
                    Navigator.pop(context);
                  }
                },
              );
            }),
          )
        ],
      ),
    );
  }
}

// Future<dynamic> showSaleBottomSheet(context) {
//   BehaviorSubject<dynamic> selectedPlatform = new BehaviorSubject<int>.seeded(null);
//   BehaviorSubject<GameCondition> selectedGameCondtion = new BehaviorSubject<GameCondition>.seeded(null);
//   BehaviorSubject<bool> platformsExpanded = new BehaviorSubject<bool>.seeded(true);

//   bool saved = false;
//   return showModalBottomSheet<void>(
//       isDismissible: false,
//       context: context,
//       builder: (context) {
//         return
//       }).then((value) {
//     if (saved && selectedPlatform.value != null && selectedGameCondtion.value != null) {
//       var data = {
//         "platformID": selectedPlatform.value,
//         "gameCondition": selectedGameCondtion.value,
//       };
//       selectedPlatform.close();
//       selectedGameCondtion.close();
//       platformsExpanded.close();
//       return data;
//     }
//     return null;
//   });
// }

Container _textButton(text, selected) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: selected ? PRIMARY_COLOR : TEXT_COLOR,
    ),
    padding: EdgeInsets.all(8.0),
    child: Text(text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: CircularBold,
          fontWeight: FontWeight.bold,
        )),
  );
}
