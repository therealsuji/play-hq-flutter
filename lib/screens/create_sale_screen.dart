import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:play_hq/blocs/createSaleBloc.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_map_setter_widget.dart';
import 'package:play_hq/widgets/directSelect/direct_select_container.dart';
import 'package:play_hq/widgets/platform_selector_widget.dart';
import 'package:play_hq/widgets/rasied_gradient_button_widget.dart';
import 'package:play_hq/widgets/text_fields/custom_textfield_widget.dart';
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
  CreateSaleBloc _createSaleBloc;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Map<String, dynamic>> _gameCondition = [
    {"name": 'Used', "status": true},
    {"name": 'New', "status": false},
    {"name": 'Mint', "status": false},
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _createSaleBloc = Provider.of<CreateSaleBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Background,
      appBar: CustomAppBarWidget(
        title: "Create Sale",
      ),
      body: DirectSelectContainer(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            CustomTextFieldWidget(
              textFieldName: "Game Title",
              sink: null,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtils.getDesignWidth(165),
                  child: CustomTextFieldWidget(
                    textFieldName: "Price",
                    sink: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      Text(
                        "Negotiable?",
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                      StreamBuilder<bool>(
                          stream: _createSaleBloc.negotiableStream,
                          initialData: false,
                          builder: (context, snapshot) {
                            return Switch(
                              activeColor: Pricetext,
                              value: snapshot.data,
                              onChanged: (val) => _createSaleBloc.setNegotiable.add(val),
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
                onTap: () => _showScaffold(), child: PlatformSelector(data: _platforms, label: "Select Game Platform")),
            CustomMapSetterWidget(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Game Condition',
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _gameCondition.asMap().entries.map((entry) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          _gameCondition = _gameCondition.map((e) {
                            e['status'] = false;
                            return e;
                          }).toList();
                          _gameCondition[entry.key]['status'] = true;
                        });
                      },
                      child: _customToggleBtn(entry.value['name'], entry.value['status']));
                }).toList()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: RaisedGradientButton(
                onPressed: () {},
                buttonText: "Create Trade Offer",
                gradient: LinearGradient(begin: Alignment(-1.0, -5.0), end: Alignment(1.0, 5.0), colors: [
                  Color(0xffFFAB1D),
                  Color(0xffF8501C),
                ], stops: [
                  0.0,
                  1.0
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customToggleBtn(label, selected) {
    return Container(
        width: ScreenUtils.getDesignWidth(105),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: selected ? Primary : Color(0xff787794),
        ),
        padding: EdgeInsets.all(15),
        child: Text(
          label,
          style: Theme.of(context).primaryTextTheme.subtitle2,
          textAlign: TextAlign.center,
        ));
  }

  void _showScaffold() {
    final snackBar = SnackBar(content: Text('Hold and drag instead of tap'));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
