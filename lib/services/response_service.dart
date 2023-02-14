

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:play_hq/services/base_managers/response_manager.dart';
import 'package:play_hq/widgets/snackbars/response_snackbar.dart';

import 'nav_service.dart';

class ResponseService extends ResponseManager{

  final NavigationService navigationService;

  ResponseService(this.navigationService);

  @override
  SnackBar showResponse(String message, Color color) {
    final context = navigationService.navigatorKey.currentState!.overlay!.context;
    final ResponseSnackBar handler = IResponseSnackBar();
    return handler.showResponse(message, color);
  }
}