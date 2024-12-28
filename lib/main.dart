import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/app.dart';
import 'package:myapp/data/repositories/authentication_repository.dart';
import 'package:myapp/firebase_options.dart';

Future<void> main() async {
  ///widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///Getx local storage
  await GetStorage.init();

  /// await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// initialize Firebase App Check
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    //webRecaptchaSiteKey: 'your-recaptcha-site-key', // For web
  );

  /// initialize authentication repository
  Get.put(AuthenticationRepository());

  //load all material design/localization/themes/bindings
  runApp(const App());
}
