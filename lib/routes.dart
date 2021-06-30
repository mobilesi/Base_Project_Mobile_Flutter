import 'package:flutter/material.dart';
import 'package:flutter_template/ui/screen/main_screen.dart';
import 'package:page_transition/page_transition.dart';

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

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return PageTransition(child: MainScreen(), type: PageTransitionType.fade);
      case splashScreen:
        return PageTransition(child: SplashScreen(), type: PageTransitionType.fade);
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
