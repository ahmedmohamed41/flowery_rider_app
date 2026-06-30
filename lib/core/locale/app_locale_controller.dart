import 'package:flutter/material.dart';

class AppLocaleController {
  AppLocaleController._();

  static final ValueNotifier<Locale> locale = ValueNotifier(
    const Locale('en'),
  );

  static void changeLocale(String languageCode) {
    locale.value = Locale(languageCode);
  }
}
