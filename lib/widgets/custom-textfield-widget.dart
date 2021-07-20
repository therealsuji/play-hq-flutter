import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';

class CustomTextfieldWidget extends StatelessWidget {

  final IconData iconData;
  final bool hideText;
  final Function(String) onChanged;
  final String errorText;
  final TextInputType type;

  CustomTextfieldWidget({this.iconData , this.hideText  , this.onChanged , this.errorText , this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: CONTAINER_COLOR,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        style: TextStyle(
          color: UNSELECTED_ITEM_COLOR,
          fontSize: 16,
        ),
        focusNode: FocusNode(),
        obscureText: hideText,
        keyboardType: type,
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Icon(iconData , color: UNSELECTED_ITEM_COLOR,),
          ),
          errorText: errorText,
          fillColor: CONTAINER_COLOR,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.only(left: 12.0 , top: 20 , bottom: 20),
        ),
      ),
    );
  }
}
