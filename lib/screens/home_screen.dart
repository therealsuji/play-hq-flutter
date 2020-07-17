import 'package:flutter/material.dart';
import 'package:play_hq/blocs/auth_bloc.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthBloc _authBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authBloc = Provider.of<AuthBloc>(context);
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
                Text('HOME'),
                RaisedButton(
                  child: Text('Log Out'),
                  onPressed: () async{
                    await _authBloc.logOut();
                    Navigator.pushReplacementNamed(context, LoginRoute );
                  },
                ), RaisedButton(
                  child: Text('Test Refresh'),
                  onPressed: () async{
                   

                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
