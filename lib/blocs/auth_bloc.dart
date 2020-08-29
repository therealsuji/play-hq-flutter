import 'dart:async';

import 'package:play_hq/constants/token.dart';
import 'package:play_hq/helpers/enums.dart';
import 'package:play_hq/helpers/network_client.dart';
import 'package:play_hq/helpers/secure_storage.dart';
import 'package:play_hq/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object {
  //used to find authentication state in splash screen
  BehaviorSubject<bool> _initialAuthStateSubject = BehaviorSubject<bool>();

  //used for email validation from backend
  PublishSubject<EmailValidType> _emailValidSubject = PublishSubject<EmailValidType>();
  Stream<EmailValidType> get getEmailValid => _emailValidSubject.stream;

  // username sink and stream
  BehaviorSubject<String> _userName = BehaviorSubject<String>();
  StreamController<String> _userNameController = StreamController<String>();
  Sink<String> get setUserName => _userNameController.sink;

  // password sink and stream
  BehaviorSubject<String> _password = BehaviorSubject<String>();
  Stream<String> get getPassword => _password.stream; // this gets value
  StreamController<String> _passwordController = StreamController<String>();
  Sink<String> get setPassword => _passwordController.sink;

  //
  PublishSubject<bool> _loginCredentialState = PublishSubject<bool>();
  Stream<bool> get getLoginCredentialStateStream => _loginCredentialState.stream;

  AuthBloc() {
    _userNameController.stream.listen((event) {
      event = event.trim();
      _userName.add(event);

      if (_userName.value.contains('@')) {
        userExists(_userName.value).then((value) {
          _emailValidSubject.add(value['status'] ? EmailValidType.EMAIL_VALID : EmailValidType.EMAIL_NOT_VALID);
        });
      } else {
        _emailValidSubject.add(EmailValidType.EMAIL_NOT_SET);
      }
    });

    _passwordController.stream.listen((event) {
      _password.add(event);
    });
  }

  Future<Stream<bool>> getAuthState() async {
    var state = await SecureStorage.readValue(ACCESS_TOKEN);
    _initialAuthStateSubject.add(state != null ? true : false);
    return _initialAuthStateSubject.stream;
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

  Future userExists(username) async {
    var res = await NetworkClient.dio.get('api/auth/user-exists/${username}');
    return res.data;
  }



  void dispose() {
    _userName.close();
    _userNameController.close();

    _password.close();
    _passwordController.close();

    _initialAuthStateSubject.close();
    _loginCredentialState.close();

    _emailValidSubject.close();
  }


}
