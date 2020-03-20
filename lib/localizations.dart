import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class AppLocalizations {
  String get appTitle => _getText('appTitle');

  static Map<String, String> _localizedValues;

  static Map<String, String> _enValues = {
    'appTitle': 'Shopping Cart',
  };

  static Map<String, String> _deValues = {
    'appTitle': 'Einkaufswagen',
  };

  static Map<String, Map<String, String>> _allValues = {
    'en': _enValues,
    'de': _deValues,
  };

  AppLocalizations(Locale locale) {
    this._locale = locale;
    _localizedValues = null;
  }

  Locale _locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String _getText(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  Locale get currentLocale => _locale;

  String get currentLanguage => _locale.languageCode;

  static Future<AppLocalizations> load(Locale locale) async {
    final translations = AppLocalizations(locale);
    _localizedValues = _allValues[locale.toString()];
    return translations;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  static final Set<Locale> supportedLocals = {
    Locale('en'),
    Locale('de'),
  };

  @override
  bool isSupported(Locale locale) => supportedLocals.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}