import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_firebase/views/locator.dart';
import 'package:otp_firebase/views/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  setupLocator();
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Color(0xffF5820D),
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white),
    debugShowCheckedModeBanner: false,
    navigatorKey: getIt<NavigationService>().navigatorKey,
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
