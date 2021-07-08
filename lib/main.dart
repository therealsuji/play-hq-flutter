import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/networks/app_configurations.dart';
import 'package:play_hq/helpers/networks/config.dart';
import 'package:play_hq/playhq_head.dart';

import 'helpers/app-service-locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  ConfigData.setBaseUrl(Environment.DEV);
  runApp(PlayHqHead());
}
