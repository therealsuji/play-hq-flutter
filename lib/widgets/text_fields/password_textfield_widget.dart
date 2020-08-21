import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';

class PasswordTextField extends StatefulWidget {
  final Stream stream;
  final Sink sink;

  PasswordTextField({
    @required this.stream,
    @required this.sink,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  FocusNode _textFieldFocus = FocusNode();
  Color _focusColor = Primary.withOpacity(0.1);
  Color _fillColorColor = InputFillColor;
  Color _currentColor;

  static String _obscureOffIcon = 'assets/icons/eye-off.svg';
  static String _obscureOnIcon = 'assets/icons/eye.svg';
  String _currentIcon = _obscureOnIcon;

  bool _obscured = true;

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
            "Password",
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
                    obscureText: _obscured,
                    focusNode: _textFieldFocus,
                    keyboardType: TextInputType.text,
                    cursorColor: Primary,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_obscured) {
                              _currentIcon = _obscureOffIcon;
                              _obscured = false;
                            } else {
                              _currentIcon = _obscureOnIcon;
                              _obscured = true;
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: SvgPicture.asset(
                            _currentIcon,
                            height: 10,
                            width: 10,
                          ),
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
