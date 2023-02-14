

import 'package:flutter/material.dart';

abstract class ResponseSnackBar{

  SnackBar showResponse(String message , Color color);
}

class IResponseSnackBar extends ResponseSnackBar {
  @override
  SnackBar showResponse(String message, Color color) {
    final SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.w600),
      ),
      backgroundColor: color,
    );
    return snackBar;
  }
}