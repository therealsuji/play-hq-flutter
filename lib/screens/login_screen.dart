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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authBloc = Provider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void nextScreen(){
    Navigator.pushReplacementNamed(context, HomeRoute);
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
                StreamBuilder<bool>(
                    stream: _authBloc.loginState,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                          nextScreen();
                          return RaisedButton(
                        onPressed: () {
                          _authBloc.login();
                        },
                        child: Text('Login'),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
