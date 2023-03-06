

import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_enums.dart';

abstract class ResponseManager{
  SnackBar showResponse(String message, Color color);

  void showAlert(AlertType type , String title , String text);

  void showConfirmationAlert(String title , String desc , VoidCallback onPressed);
}