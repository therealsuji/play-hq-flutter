import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:play_hq/models/app-search-game-model.dart';
import 'package:play_hq/playhq-head.dart';
import 'helpers/app-service-locator.dart';
import 'helpers/networks/app-config.dart';
import 'helpers/networks/app-configurations.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appDocumentaryDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentaryDirectory.path);
  setupLocator();
  ConfigData.setBaseUrl(Environment.DEV);
  Hive.registerAdapter(GameDetailsAdapter());
  runApp(PlayHqHead());
}
