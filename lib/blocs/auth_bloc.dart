import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:play_hq/constants/token.dart';
import 'package:play_hq/helpers/network_client.dart';
import 'package:play_hq/helpers/secure_storage.dart';
import 'package:play_hq/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object {
  StreamController<bool> _emailValidController = StreamController<bool>.broadcast();

  Stream<bool> get emailValid => _emailValidController.stream;

  BehaviorSubject<String> _userName = BehaviorSubject<String>(); //this holds value
  StreamController<String> _userNameController = StreamController();

  Sink<String> get setUserName => _userNameController.sink; // sink is exposed and is used to add data

  BehaviorSubject<String> _password = BehaviorSubject<String>();

  Stream<String> get getPassword => _password.stream; // this gets value
  StreamController<String> _passwordController = StreamController();

  Sink<String> get setPassword => _passwordController.sink; // sink is exposed and is used to add data

  BehaviorSubject<bool> _initialAuthState = BehaviorSubject<bool>();
  PublishSubject<bool> _loginCredentialState = PublishSubject();

  Stream<bool> get getLoginCredentialState => _loginCredentialState.stream;

  AuthBloc() {
    _userNameController.stream.listen((event) {
      event = event.trim();
      _userName.add(event);

      if (event.length > 4) {
        userExists().then((value) {
          print(value['status']);
          _emailValidController.add(value['status']);
        });
      } else {
        _emailValidController.add(null);
      }
    });

    _passwordController.stream.listen((event) {
      _password.add(event);
    });
  }

  Future<Stream<bool>> getAuthState() async {
    var state = await SecureStorage.readValue(ACCESS_TOKEN);

    _initialAuthState.add(state != null ? true : false);
    return _initialAuthState.stream;
  }

  void login() async {
    try {
      var res =
          await NetworkClient.dio.post('api/auth/login', data: {"email": _userName.value, "password": _password.value});
      var userData = UserLoginModel.fromJson(res.data);

      SecureStorage.writeValue(ACCESS_TOKEN, userData.auth.accessToken);
      SecureStorage.writeValue(REFRESH_TOKEN, userData.auth.refreshToken);
      _loginCredentialState.sink.add(true);
    } catch (e) {
      _loginCredentialState.sink.add(false);
    }
  }

  Future logOut() async {
    await SecureStorage.deleteAll();
  }

  Future userExists() async {
    var res = await NetworkClient.dio.get('api/auth/user-exists/${_userName.value}');
    return res.data;
  }

  void test() async {
    try {
      var res = await NetworkClient.dio.get('/auth');
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    _userName.close();
    _userNameController.close();

    _password.close();
    _passwordController.close();

    _initialAuthState.close();
    _loginCredentialState.close();

    _emailValidController.close();
  }
}
