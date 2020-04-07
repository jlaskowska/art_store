import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class AppLocalizations {
  static String get bottomNavigationBarMenuHome => _getText('bottomNavigationBarMenuHome');

  static String get bottomNavigationBarMenuCart => _getText('bottomNavigationBarMenuCart');

  static String get appBarHeadlineArt => _getText('appBarHeadlineArt');

  static String get appBarHeadlineStore => _getText('appBarHeadlineStore');

  static String get productDetailScreenAddToBasketButton => _getText('productDetailScreenAddToBasketButton');

  static String get shoppingCartScreenEmptyCartText => _getText('shoppingCartScreenEmptyCartText');

  static String get shoppingCartScreenTotal => _getText('shoppingCartScreenTotal');

  static String get shoppingCartButtonCheckout => _getText('shoppingCartButtonCheckout');

  static String get shoppingCartButtonCheckoutOK => _getText('shoppingCartButtonCheckoutOK');

  static String get shoppingCartButtonCheckoutContent => _getText('shoppingCartButtonCheckoutContent');

  static String get shoppingCartButtonCheckoutTitle => _getText('shoppingCartButtonCheckoutTitle');

  static Map<String, String> _localizedValues;

  static Map<String, String> _enValues = {
    'bottomNavigationBarMenuHome': 'Home',
    'bottomNavigationBarMenuCart': 'Cart',
    'appBarHeadlineArt': 'Art',
    'appBarHeadlineStore': 'Store',
    'productDetailScreenAddToBasketButton': 'Add to basket',
    'shoppingCartScreenEmptyCartText': 'Your cart is empty.',
    'shoppingCartScreenTotal': 'Total:',
    'shoppingCartButtonCheckout': 'Checkout',
    'shoppingCartButtonCheckoutOK': 'Ok',
    'shoppingCartButtonCheckoutContent': 'Congratualtions! We have received your order.',
    'shoppingCartButtonCheckoutTitle': 'Oder Confirmation',
  };

  static Map<String, String> _deValues = {
    'bottomNavigationBarMenuHome': 'Startseite',
    'bottomNavigationBarMenuCart': 'Warenkorb',
    'appBarHeadlineArt': 'Art',
    'appBarHeadlineStore': 'Store',
    'productDetailScreenAddToBasketButton': 'Zum Warenkorb hinzufügen',
    'shoppingCartScreenEmptyCartText': 'Dein Warenkorb ist leer.',
    'shoppingCartScreenTotal': 'Summe:',
    'shoppingCartButtonCheckout': 'Kasse',
    'shoppingCartButtonCheckoutOK': 'Ok',
    'shoppingCartButtonCheckoutContent': 'Herzlichen Glückwunsch! Wir haben Ihre Bestellung bekommen.',
    'shoppingCartButtonCheckoutTitle': 'Bestellbestätigung',
  };

  static Map<String, Map<String, String>> _allValues = {
    'en': _enValues,
    'de': _deValues,
  };

  AppLocalizations(Locale locale) {
    _locale = locale;
    _localizedValues = null;
  }

  static Locale _locale;

  static String _getText(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Locale get currentLocale => _locale;

  static String get currentLanguage => _locale.languageCode;

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
