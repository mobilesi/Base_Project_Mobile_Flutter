import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/constants.dart';
import 'package:flutter_template/localizations.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super(Constants.VI);

  void changeLanguage(String language) async {
    await LanguageDelegate().load(Locale(language));
    emit(language);
  }
}
