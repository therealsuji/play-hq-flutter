import 'package:flutter/material.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final Sink sink;
  final String textFieldName;
  final Color backColor;

  CustomTextFieldWidget({
    @required this.sink,
    this.textFieldName, this.backColor = ContainerColor,
  });

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  FocusNode _textFieldFocus = FocusNode();
  Color _focusColor = Primary.withOpacity(0.1);
  Color _fillColorColor = InputFillColor;
  Color _currentColor;

  @override
  void initState() {
    _currentColor = _fillColorColor;
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _currentColor = _focusColor;
        });
      } else {
        setState(() {
          _currentColor = _fillColorColor;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
         widget.textFieldName,
          style: Theme.of(context).primaryTextTheme.headline3,
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: TextField(
            onChanged: (val) {
              widget.sink.add(val);
            },
            style: TextStyle(
              color: Color(0xffDEDFE1),
              fontSize: 18,
            ),
             focusNode: _textFieldFocus,
            keyboardType: TextInputType.text,
            cursorColor: Primary,
            decoration: InputDecoration(
              fillColor: _currentColor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Primary),
                borderRadius: BorderRadius.circular(6),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.only(left: 12.0, top: 15, bottom: 15),
            ),
          ),
        ),
      ]),
    );
  }
}
