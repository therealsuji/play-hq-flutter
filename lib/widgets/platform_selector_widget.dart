 import 'package:flutter/material.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'directSelect/direct_select_item.dart';
import 'directSelect/direct_select_list.dart';

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
            margin: EdgeInsets.only(top: 20),
            alignment: AlignmentDirectional.centerStart,
            child: Text(label,
                style: TextStyle(fontSize: 18, fontFamily: CircularBold, color: Color(0xffB5BDD5).withOpacity(0.8)))),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 3, bottom: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: SubContainerColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Expanded(
                  // TODO : Custom List widget
                  // TODO : have to add left radius to container
                    child: DirectSelectList<String>(
                      values: data,
                      defaultItemIndex: 0,
                      itemBuilder: (String value) => getDropDownMenuItem(value),
                      focusedItemDecoration: _getDslDecoration(),
                    )),
              ),
              Container(margin: EdgeInsets.only(right: 10), child: _getDropdownIcon())
            ],
          ),
        ),
      ],
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 50,
        value: value,
        itemBuilder: (context, value) {
          return Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                value,
                style: TextStyle(fontFamily: CircularBook, fontSize: 16, color: Colors.white),
              ));
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Primary),
        top: BorderSide(width: 1, color: Primary),
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
