import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/directSelect/direct_select_container.dart';
import 'package:play_hq/widgets/directSelect/direct_select_item.dart';
import 'package:play_hq/widgets/directSelect/direct_select_list.dart';

class CreateTradeScreen extends StatefulWidget {
  CreateTradeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateTradeScreenState createState() => _CreateTradeScreenState();
}

List<String> _meals = [
  "PlayStation 4",
  "Xbox One",
  "Nintendo Switch",
  "Playstation 3",
  "Xbox 360",
];

class _CreateTradeScreenState extends State<CreateTradeScreen> {

  int selectedFoodVariants = 0;
  int selectedPortionCounts = 0;
  int selectedPortionSize = 0;

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appBar = PreferredSize(
        child: Container(
          margin: EdgeInsets.only(left: 24 , right: 24 , top: 40),
          decoration: BoxDecoration(
              color: Background,),
          child: Padding(
              padding: EdgeInsets.only(bottom: 20 , top: 20),
              child: Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/back.svg'),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Creat Trade Request' , style: TextStyle(fontFamily: CircularBold , fontWeight: FontWeight.bold , fontSize: 20 , color: Colors.white),),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/notification.svg'),
                  ],
                ),
              )),
        ),
        preferredSize: Size.fromHeight(90));

    return Scaffold(
      appBar: appBar,
      key: scaffoldKey,
      backgroundColor: Background,
      body: Container(
        margin: EdgeInsets.only(top: 25 , left: 24 , right: 24),
        child: DirectSelectContainer(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    PlatformSelector(data: _meals, label: "Select Game Platform"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showScaffold() {
    final snackBar = SnackBar(content: Text('Hold and drag instead of tap'));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }
}

class PlatformSelector extends StatelessWidget {
  final buttonPadding = const EdgeInsets.fromLTRB(0, 8, 0, 0);

  final List<String> data;
  final String label;

  PlatformSelector({@required this.data, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text(label , style: TextStyle(fontSize: 18, fontFamily: CircularBold , color: Color(0xffB5BDD5).withOpacity(0.8)))),
        Container(
          margin: EdgeInsets.only(top: 20),
          color: SubContainerColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Expanded(
                    child: DirectSelectList<String>(
                      values: data,
                      defaultItemIndex: 0,
                      itemBuilder: (String value) =>
                          getDropDownMenuItem(value),
                      focusedItemDecoration: _getDslDecoration(),
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: _getDropdownIcon())
            ],
          ),
        ),
      ],
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(value , style: TextStyle(fontFamily: CircularBook , fontSize: 16 , color: Colors.white),));
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Primary,
    );
  }
}

