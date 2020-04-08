import 'package:intl/intl.dart';
import 'package:art_store/localizations.dart';

final currencyFormatter = NumberFormat.currency(
  locale: AppLocalizations.currentLocale.toString(),
  symbol: '€',
  decimalDigits: 2,
);
