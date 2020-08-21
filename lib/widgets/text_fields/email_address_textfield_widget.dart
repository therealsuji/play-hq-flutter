import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';

class EmailAddressTextField extends StatefulWidget {
  final Stream stream;
  final Sink sink;

  EmailAddressTextField({
    @required this.stream,
    @required this.sink,
  });

  @override
  _EmailAddressTextFieldState createState() => _EmailAddressTextFieldState();
}

class _EmailAddressTextFieldState extends State<EmailAddressTextField> {
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
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
                fontFamily: CircularBook),
          ),
          StreamBuilder<String>(
              stream: widget.stream,
              builder: (context, snapshot) {
                return Container(
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
                      suffixIcon: Container(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: SvgPicture.asset(
                          'assets/icons/check.svg',
                          height: 10,
                          width: 10,
                        ),
                      ),
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
                      contentPadding: EdgeInsets.all(15.0),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
