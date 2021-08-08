import 'package:flutter/material.dart';

abstract class LoadingOverlayModel extends ChangeNotifier {
  bool get isLoading;
  void dispose();
}
