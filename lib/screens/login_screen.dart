import 'dart:async';

import 'package:flutter/material.dart';
import 'package:play_hq/blocs/auth_bloc.dart';
import 'package:play_hq/constants/route_constants.dart';
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
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authBloc = Provider.of<AuthBloc>(context);

    if (_authBloc.loginState.stream != _previousStream) {
      _streamSubscription?.cancel();
      _previousStream = _authBloc.loginState.stream;
      _listen(_authBloc.loginState.stream);
    }
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    onChanged: (val) {
                      _authBloc.setUserName.add(val);
                    },
                    decoration: InputDecoration(hintText: "UserName"),
                  ),
                ),
                Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<String>(
                      stream: _authBloc.getUserName,
                      builder: (context, snapshot) {
                        return Text(snapshot.hasData ? snapshot.data : '');
                      }),
                ),
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
      ),
    );
  }
}
