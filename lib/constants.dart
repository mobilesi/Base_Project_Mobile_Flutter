import 'dart:ui';

class Constants {
  // locale
  static const String VI = "vi";
  static const String EN = "en";
  static const SUPPORT_LOCALE = [Locale(VI), Locale(EN)];
}

class FormatDate {
  static final String full = "dd/MM/yyyy HH:mm:ss";
  static final String dayMonthYear = "dd/MM/yyyy";
  static final String hhMMss = "HH:mm ss";
}
