import 'package:UpTech/api/firebase_api.dart';
import 'package:UpTech/app/page/messenger/message_page.dart';
import 'package:UpTech/tool/preference_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(PreferenceUtils(), signalsReady: true);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAPI().initNotifications();
  initialization();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

void initialization() async {
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
}
