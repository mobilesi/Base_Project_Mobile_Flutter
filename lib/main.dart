import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/language_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection_container.dart' as getIt;
import 'ui/app.dart';
import 'utils/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt.init();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? language = preferences.getString(SPrefCache.PREF_KEY_LANGUAGE);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => LanguageCubit(),
    ),
  ], child: MyApp.language(language)));
}
