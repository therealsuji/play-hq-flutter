import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/playhq-head.dart';
import 'service-locator.dart';
import 'helpers/networks/app-config.dart';
import 'helpers/networks/app-configurations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  APIConfig.setBaseUrl(Environment.STAGE);
  await Firebase.initializeApp();
  setupLocator();
  runApp(PlayHqHead());
}
