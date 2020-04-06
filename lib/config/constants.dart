import 'package:intl/intl.dart';
import 'package:shopping_cart/localizations.dart';

final currencyFormatter = NumberFormat.currency(
  locale: AppLocalizations.currentLocale.toString(),
  symbol: '€',
  decimalDigits: 2,
);
