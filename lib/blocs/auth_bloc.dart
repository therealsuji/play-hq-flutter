import 'dart:async';
import 'dart:convert';
import 'package:play_hq/constants/token.dart';
import 'package:play_hq/helpers/network_client.dart';
import 'package:play_hq/helpers/secure_storage.dart';
import 'package:play_hq/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object {
  BehaviorSubject<String> _userName =
      BehaviorSubject<String>(); //this holds value
  Stream<String> get getUserName => _userName.stream; // this gets value
  StreamController<String> _userNameController = StreamController();

  Sink<String> get setUserName =>
      _userNameController.sink; // sink is exposed and is used to add data

  BehaviorSubject<String> _password = BehaviorSubject<String>();

  Stream<String> get getPassword => _password.stream; // this gets value
  StreamController<String> _passwordController = StreamController();

  Sink<String> get setPassword =>_passwordController.sink; // sink is exposed and is used to add data

  BehaviorSubject<bool> _initialAuthState = BehaviorSubject<bool>();
  PublishSubject<bool> loginState = PublishSubject();

  AuthBloc() {

  }

  Future<Stream<bool>> getAuthState() async {
    var state = await SecureStorage.readValue(ACCESS_TOKEN);
    _initialAuthState.add(state != null ? true : false);
    return _initialAuthState.stream;
  }

  void login() async {
    try {
      var res = await NetworkClient.dio.post('/auth/login', data: {"email": 'sujitha123@gmail.com', "password": 'sujitharox'});
      var userData = UserLoginModel.fromJson(res.data);
      SecureStorage.writeValue(ACCESS_TOKEN, userData.auth.accessToken);
      SecureStorage.writeValue(REFRESH_TOKEN, userData.auth.refreshToken);
      loginState.sink.add(true);
    } catch (e) {

      loginState.addError('Invalid Credentials');
    }
  }

  void logOut() async {
    await SecureStorage.deleteAll();
  }

  void test() async {
    try {
      var res = await NetworkClient.dio.get('/auth');
    } catch (e) {print(e);}
  }

  void dispose() {
    _userName.close();
    _userNameController.close();

    _password.close();
    _passwordController.close();

    _initialAuthState.close();
    loginState.close();
  }
}
