import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  void pop({Object? args}) {
    _navigatorKey.currentState!.pop(args);
  }

  Future<dynamic> pushReplacement(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: args);
  }

  void popUntil(String routeName) {
    return _navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  Future<dynamic> pushAndRemoveUntil(String routeName, {Object? args}) {
    return _navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: args);
  }

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
