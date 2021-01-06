import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/blocs/bloc_observer.dart';
import 'package:flutter_template/constants.dart';
import 'package:flutter_template/localizations.dart';
import 'package:flutter_template/routes.dart';
import 'package:flutter_template/utils/navigator.dart';

import '../route_observer.dart';

class MyApp extends StatelessWidget {
  final _routeObserver = MyObserver();

  final String language;

  MyApp.language(this.language);

  @override
  Widget build(BuildContext context) {
    Bloc.observer = MyBlocObserver();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [_routeObserver],
      navigatorKey: NavigationService.instance.navigatorKey,
      localizationsDelegates: [
        const LanguageDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      locale: this.language == null
          ? Constants.SUPPORT_LOCALE[0]
          : Locale(this.language),
      supportedLocales: Constants.SUPPORT_LOCALE,
      localeResolutionCallback: (locale, supportedLocales) =>
          _localeCallback(locale, supportedLocales),
      initialRoute: Routes.initScreen(),
      routes: Routes.routes,
    );
  }

  Locale _localeCallback(Locale locale, Iterable<Locale> supportedLocales) {
    if (locale == null) {
      return supportedLocales.first;
    }
    // Check if the current device locale is supported
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
    // If the locale of the device is not supported, use the first one
    // from the list (japanese, in this case).
    return supportedLocales.first;
  }
}
