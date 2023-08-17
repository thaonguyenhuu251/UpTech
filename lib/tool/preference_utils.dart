import 'dart:async' show Future;
import 'package:UpTech/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils extends ChangeNotifier {
  SharedPreferences? _prefsInstance;
  static const checkUserLogin = "checkUserLogin";

  PreferenceUtils() {
    _init();
  }

  Future<void> _init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    getIt.signalReady(this);
  }

  bool getBool(String key, [bool elseValue = false]) {
    return _prefsInstance?.getBool(key) ?? elseValue;
  }

  Future<bool> setBool(String key, bool value) async {
    return _prefsInstance?.setBool(key, value) ?? Future.value(false);
  }

  bool getBoolUserLogin([bool elseValue = false]) {
    return _prefsInstance?.getBool(checkUserLogin) ?? elseValue;
  }

  Future<bool> setBoolUserLogin(bool value) async {
    return _prefsInstance?.setBool(checkUserLogin, value) ?? Future.value(false);
  }
}