

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {

  void createLocalData(String key , data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(key));
  }

  dynamic readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key) ?? '');
  }

  void deleteData(String key) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}