import 'package:flutter/material.dart';
import 'package:flutter_template/ui/screen/main_screen.dart';

import 'ui/screen/splash_screen.dart';

class Routes {
  Routes._();

  //screen name
  static const String splashScreen = "/splashScreen";
  static const String loginScreen = "/loginScreen";
  static const String mainScreen = "/mainScreen";

  //init screen name
  static String initScreen() => splashScreen;

  static final routes = <String, WidgetBuilder>{
    splashScreen: (context) => SplashScreen(),
    mainScreen: (context) => MainScreen(),
  };
}
