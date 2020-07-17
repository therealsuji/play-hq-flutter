import 'dart:async';
import 'dart:convert';
import 'package:play_hq/constants/token.dart';
import 'package:play_hq/helpers/network_client.dart';
import 'package:play_hq/helpers/secure_storage.dart';
import 'package:play_hq/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object {
  BehaviorSubject<String> _email = BehaviorSubject<String>(); //this holds value
  Stream<String> get getEmail =>
      _email.stream; // this is used for validations and getting the value
  StreamController<String> _emailController = StreamController();
  Sink<String> get setEmail =>
      _emailController.sink; // sink is exposed and is used to add data

  BehaviorSubject<String> _password = BehaviorSubject<String>();
  Stream<String> get getPassword =>
      _password.stream; // this is used for validations and getting the value
  StreamController<String> _passwordController = StreamController();
  Sink<String> get setPassword =>
      _passwordController.sink; // sink is exposed and is used to add data

  BehaviorSubject<bool> _initialAuthState = BehaviorSubject<bool>();
  PublishSubject<bool> _loginState = PublishSubject(); // this holds value
  Stream<bool> get getLoginState =>
      _loginState.stream; // this gets the login state
  Sink<bool> get setLoginState => _loginState.sink; // this sets the login state

  AuthBloc() {
    _emailController.stream.listen((event) {
      _email.add(event);
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
    if ((_email.value == null) || !_email.value.contains('@')) {
      print('bad');
      _email.addError('Enter a valid email');
      return;
    }
     
    if ((_password.value == null)) {
      _password.addError('Enter a valid password');
      return;
    }

    try {
      var res = await NetworkClient.dio.post('/auth/login',
          data: {"email": _email.value.trim(), "password": _password.value.trim()});
      _email.value = null;
      _password.value = null;
      var userData = UserLoginModel.fromJson(res.data);
      SecureStorage.writeValue(ACCESS_TOKEN, userData.auth.accessToken);
      SecureStorage.writeValue(REFRESH_TOKEN, userData.auth.refreshToken);
      setLoginState.add(true);
    } catch (e) {
     
      _loginState.addError('Invalid Credentials');
    }
  }

  void logOut() async {
    await SecureStorage.deleteAll();
  }

  void dispose() {
    _email.close();
    _emailController.close();

    _password.close();
    _passwordController.close();

    _initialAuthState.close();
    _loginState.close();
  }
}
