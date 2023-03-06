

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/services/base_managers/response_manager.dart';
import 'package:play_hq/widgets/alerts/alert_dialog.dart';
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

  @override
  void showConfirmationAlert(String title , String desc , VoidCallback onPressed){
    final context = navigationService.navigatorKey.currentState!.overlay!.context;
    final CustomAlert alert = CustomAlertImpl(context: context, type: AlertType.CONFIRMATION , title: title , desc: desc , onPressed: onPressed);
    showDialog(context: context, builder: (BuildContext context){
      return alert.showAlert();
    });
  }

  @override
  void showAlert(AlertType type, String title, String text) {
    final context = navigationService.navigatorKey.currentState!.overlay!.context;
    final CustomAlert alert = CustomAlertImpl(context: context, type: type);
    showDialog(context: context, builder: (BuildContext context){
      debugPrint('Alert Type is $type');
      return alert.showAlert();
    });
  }
}