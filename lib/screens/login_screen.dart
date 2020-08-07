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
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<String>(
                  builder: (context, snapshot) {
                    return Container(
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        onChanged: (val) {
                        },
                        decoration: InputDecoration(
                          errorText: snapshot.error,
                          errorStyle:TextStyle(color: Colors.red) ,
                          hintText: "Email"
                          ),
                      ),
                    );
                  }
                ),
                SizedBox(height: 15,),
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
                          errorStyle:TextStyle(color: Colors.red) ,
                          hintText: "Password"
                          ),
                      ),
                    );
                  }
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
