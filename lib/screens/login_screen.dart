import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/blocs/auth_bloc.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/text_fields/email_address_textfield_widget.dart';
import 'package:play_hq/widgets/text_fields/password_textfield_widget.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc _authBloc;

  Stream _previousStream;
  StreamSubscription _streamSubscription;



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authBloc = Provider.of<AuthBloc>(context);

    if (_authBloc.getLoginCredentialStateStream != _previousStream) {
      _streamSubscription?.cancel();
      _previousStream = _authBloc.getLoginCredentialStateStream;
      _listen(_authBloc.getLoginCredentialStateStream);
    }
  }

  void _listen(Stream<bool> stream) {
    _streamSubscription = stream.listen((state) {
      if (state) {
        Navigator.pushReplacementNamed(context, MainScreenRoute);
      }
    }, onError: (e) {

    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/login-bg.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(113)),
                    child: Text(
                      'Welcome Back Damsara!',
                      style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: CircularBook),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Please sign in to continue',
                      style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontFamily: CircularBook),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 29),
                    child: EmailAddressTextField(stream: _authBloc.getEmailValid, sink: _authBloc.setUserName),
                  ),
                  PasswordTextField(sink: _authBloc.setPassword),
                  StreamBuilder<bool>(
                    stream:_authBloc.getLoginCredentialStateStream,
                    builder: (context, snapshot) {
                      return snapshot.data == false
                          ? Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          'The password you entered is incorrect',
                          style: TextStyle(color: Colors.red.withOpacity(0.8), fontSize: 16, fontFamily: CircularBook),
                        ),
                      )
                          : Padding(padding: const EdgeInsets.only(top: 15));
                    }
                  ),
                  Container(
                      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(50)),
                      width: double.infinity,
                      height: ScreenUtils.getDesignHeight(45),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0), side: BorderSide(color: Primary)),
                          color: Primary,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontFamily: Neusa, fontSize: 18),
                          ),
                          onPressed: () {
                            _authBloc.login();
                          }))
                ],
              ),
            ),
          ),
        ));
  }
}
