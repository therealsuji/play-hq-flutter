import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/playhq_head.dart';
import 'injection_container.dart' as di;
import 'helpers/networks/app_config.dart';
import 'helpers/networks/app_configurations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  APIConfig.setBaseUrl(Environment.DEV);
  await Firebase.initializeApp();
  di.init();
  runApp(PlayHqHead());
}
