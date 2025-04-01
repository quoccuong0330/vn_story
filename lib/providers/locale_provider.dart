import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['en', 'vi'].contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners();
  }
}
