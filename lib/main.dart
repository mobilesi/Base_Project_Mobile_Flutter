import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/language_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/app.dart';
import 'utils/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String language = preferences.getString(SPrefCache.PREF_KEY_LANGUAGE);
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
  }
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => LanguageCubit(),
    ),
  ], child: MyApp.language(language)));
}
