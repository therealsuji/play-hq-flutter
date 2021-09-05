import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final IconData? iconData;
  final bool? hideText;
  final Function(String)? onChanged;
  final String? errorText;
  final TextInputType? type;

  CustomTextfieldWidget({this.iconData, this.hideText, this.onChanged, this.errorText, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        style: TextStyle(
          color: SUB_TEXT_COLOR,
          fontSize: 16,
        ),
        obscureText: hideText!,
        keyboardType: type,
        maxLines: type == TextInputType.multiline ? 4 : null,
        minLines: type == TextInputType.multiline ? 4 : null,
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          prefixIcon: iconData != null
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Icon(
                    iconData,
                    color: SUB_TEXT_COLOR,
                  ),
                )
              : null,
          errorText: errorText,
          fillColor: MAIN_CONTAINER_COLOR.withOpacity(0.4),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.only(left: 12.0, top: 20, bottom: 20),
        ),
      ),
    );
  }
}
