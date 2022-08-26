import 'package:flutter/material.dart';
import 'package:play_hq/services/base_managers/exceptions.dart';
import 'package:play_hq/widgets/custom_snackbar.dart';

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

  Future<dynamic> pushAndRemoveUntil(String routeName, {Object? args}) {
    return _navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: args);
  }

  void showError(PlayHQException exception) {
    final context = _navigatorKey.currentState!.overlay!.context;
    final DisplayError handler = DisplayImpl();
    handler.showError(context, exception);
  }

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
