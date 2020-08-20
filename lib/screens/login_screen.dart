import 'dart:async';

import 'package:flutter/material.dart';
import 'package:play_hq/blocs/auth_bloc.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/my_flutter_app_icons.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc _authBloc;

  Stream _previousStream;
  StreamSubscription _streamSubscription;

  void _listen(Stream<bool> stream) {
    _streamSubscription = stream.listen((state) {
      if (state) {
        Navigator.pushReplacementNamed(context, HomeRoute);
      }
    }, onError: (e) {
      print(e);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authBloc = Provider.of<AuthBloc>(context);

    /*  if (_authBloc.getLoginState != _previousStream) {
      _streamSubscription?.cancel();
      _previousStream = _authBloc.getLoginState;
      _listen(_authBloc.getLoginState);
    }*/
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Background,
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/login-bg.png'),
                  fit: BoxFit.cover)),
        ),
        Positioned.fill(
          left: 24,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(113)),
                child: Text(
                  'Welcome Back Damsara!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: CircularBook),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Please sign in to continue',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 18,
                      fontFamily: CircularBook),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: _textInput(isPassword: false, inputFieldName: ""),
              )
            ],
          ),
        ),
      ],
    ));
  }

  Widget _textInput(
      {@required bool isPassword, @required String inputFieldName}) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            'Email Address/Usernmame',
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
                fontFamily: CircularBook),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextField(
              obscureText: isPassword,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: inputFieldName,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .body2
                      .copyWith(fontSize: ScreenUtils.bodyWidth * 0.035)),
            ),
          )
        ],
      ),
    );
  }

  Widget oldWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(builder: (context, snapshot) {
                return Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    onChanged: (val) {},
                    decoration: InputDecoration(
                        errorText: snapshot.error,
                        errorStyle: TextStyle(color: Colors.red),
                        hintText: "Email"),
                  ),
                );
              }),
              SizedBox(
                height: 15,
              ),
              StreamBuilder<String>(
                  stream: _authBloc.getPassword,
                  builder: (context, snapshot) {
                    return Container(
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        onChanged: (val) {
                          _authBloc.setPassword.add(val);
                        },
                        decoration: InputDecoration(
                            errorText: snapshot.error,
                            errorStyle: TextStyle(color: Colors.red),
                            hintText: "Password"),
                      ),
                    );
                  }),
              RaisedButton(
                onPressed: () {
                  _authBloc.login();
                },
                child: Text('Login'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
